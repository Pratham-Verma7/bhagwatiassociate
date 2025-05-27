import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/utils/database/database_helper.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class OfflineSyncService extends GetxService {
  static OfflineSyncService get instance => Get.find<OfflineSyncService>();
  final _dbHelper = DatabaseHelper.instance;
  final _connectivity = Connectivity();
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
        syncOfflineLeads();
      }
    });
  }

  void _startPeriodicSync() {
    // Check for offline leads every 5 minutes
    Future.delayed(const Duration(minutes: 5), () {
      if (_isOnline) {
        syncOfflineLeads();
      }
      _startPeriodicSync();
    });
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
      print('Error saving offline lead: $e');
    }
  }

  Future<void> syncOfflineLeads() async {
    if (!_isOnline) return;

    try {
      final unsyncedLeads = await _dbHelper.getUnsyncedLeads();

      for (var lead in unsyncedLeads) {
        try {
          final formData = jsonDecode(lead['form_data'] as String);
          final verificationType = lead['verification_type'] as String;

          // Determine the correct API endpoint based on verification type
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

          // Submit the lead
          final response = await SHttpHelper.post(endpoint, formData);

          if (response != null &&
              (response['success'] == true || response['id'] != null)) {
            // Update lead status if leadId exists using PUT method
            if (lead['lead_id'] != null) {
              await SHttpHelper.put(
                'api/update/leads/${lead['lead_id']}',
                {'status': 2},
              );
            }

            // Mark as synced and delete from local database
            await _dbHelper.markLeadAsSynced(lead['id'] as int);
            await _dbHelper.deleteSyncedLead(lead['id'] as int);
          }
        } catch (e) {
          print('Error syncing lead ${lead['id']}: $e');
          // Continue with next lead even if one fails
          continue;
        }
      }
    } catch (e) {
      print('Error in syncOfflineLeads: $e');
    }
  }
}
