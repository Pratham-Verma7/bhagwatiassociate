import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/utils/database/database_helper.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/features/leads/data/services/image_service.dart';
import 'package:path/path.dart' as path_lib;

class OfflineSyncService extends GetxService {
  static OfflineSyncService get instance => Get.find<OfflineSyncService>();
  final _dbHelper = DatabaseHelper.instance;
  final _connectivity = Connectivity();
  final _imageService = ImageService.instance;
  bool _isOnline = true;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _startPeriodicSync();
  }

  void _initConnectivity() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _isOnline = result != ConnectivityResult.none;
      if (_isOnline) {
        syncOfflineData();
      }
    });
  }

  void _startPeriodicSync() {
    Future.delayed(const Duration(minutes: 5), () {
      if (_isOnline) {
        syncOfflineData();
      }
      _startPeriodicSync();
    });
  }

  Future<void> syncOfflineData() async {
    await syncOfflineLeads();
    await syncOfflineImages();
  }

  Future<void> saveOfflineLead({
    required int? leadId,
    required String verificationType,
    required Map<String, dynamic> formData,
  }) async {
    try {
      await _dbHelper.insertOfflineLead({
        'lead_id': leadId,
        'verification_type': verificationType,
        'form_data': jsonEncode(formData),
      });
    } catch (e) {
      // Error handling
    }
  }

  Future<void> saveOfflineImage({
    required int? leadId,
    required String localPath,
  }) async {
    try {
      await _dbHelper.insertOfflineImage({
        'lead_id': leadId,
        'local_path': localPath,
      });
    } catch (e) {
      // Error handling
    }
  }

  Future<void> syncOfflineLeads() async {
    if (!_isOnline) return;

    try {
      final unsyncedLeads = await _dbHelper.getUnsyncedLeads();

      if (unsyncedLeads.isEmpty) {
        return;
      }

      for (var lead in unsyncedLeads) {
        try {
          final formData = jsonDecode(lead['form_data'] as String);
          final verificationType = lead['verification_type'] as String;

          String endpoint = 'api/add/';
          switch (verificationType) {
            case 'residence_verification':
              endpoint += 'residence_lead_verifications';
              break;
            case 'office_verification':
              endpoint += 'office_lead_verifications';
              break;
            case 'matrix_verification':
            case 'matrix':
              endpoint += 'lead_matrix';
              break;
            case 'employee_address_verification':
              endpoint += 'lead_employee_address_verification';
              break;
            case 'insurance_form':
              endpoint += 'lead_insurance';
              break;
            default:
              continue;
          }

          final response = await SHttpHelper.post(endpoint, formData);

          if (response != null &&
              (response['success'] == true || response['id'] != null)) {
            if (lead['lead_id'] != null) {
              await SHttpHelper.put(
                'api/update/leads/${lead['lead_id']}',
                {'status': 2},
              );
            }

            await _dbHelper.markLeadAsSynced(lead['id'] as int);
            await _dbHelper.deleteSyncedLead(lead['id'] as int);
          }
        } catch (e) {
          continue;
        }
      }
    } catch (e) {
      // Error handling
    }
  }

  Future<void> syncOfflineImages() async {
    if (!_isOnline) return;

    try {
      final unsyncedImages = await _dbHelper.getUnsyncedImages();

      if (unsyncedImages.isEmpty) {
        return;
      }

      for (var image in unsyncedImages) {
        try {
          final localPath = image['local_path'] as String;
          final leadId = image['lead_id'] as int?;

          if (leadId == null) {
            await _dbHelper.deleteSyncedImage(image['id'] as int);
            continue;
          }

          final imageFile = File(localPath);
          if (!await imageFile.exists()) {
            await _dbHelper.deleteSyncedImage(image['id'] as int);
            continue;
          }

          final uploadedImageUrl =
              await _imageService.uploadSingleImageForSync(imageFile);

          final uri = Uri.parse(uploadedImageUrl);
          final pathSegments =
              uri.pathSegments.where((s) => s.isNotEmpty).toList();
          final imagePath = path_lib
              .joinAll(pathSegments.sublist(pathSegments.length > 0 ? 0 : 0));

          await SHttpHelper.post('api/add/images', {
            'lead_id': leadId,
            'path': imagePath,
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          });

          await _dbHelper.markImageAsSynced(image['id'] as int);
          await _dbHelper.deleteSyncedImage(image['id'] as int);
        } catch (e) {
          continue;
        }
      }
    } catch (e) {
      // Error handling
    }
  }
}
