import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/features/auth/data/models/user_model.dart';
import 'package:bhagwatiassociate/data/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';

class LeadService {
  static final LeadService instance = LeadService._internal();
  final _authRepo = AuthRepository.instance;
  final _storage = GetStorage();
  final _apiService = ApiService.instance;

  LeadService._internal();

  /// Get leads by user ID
  Future<List<LeadModel>> getLeadsByUserId() async {
    try {


      // Get current user first
      final userData = _storage.read('userDetails');
      if (userData == null) {
        throw Exception('User not authenticated');
      }

      final currentUser = UserModel.fromJson(userData);
      if (currentUser.id == null) {

        throw Exception('User ID not found');
      }



      // Get all leads and filter for status=0
      final response = await SHttpHelper.get(
          'api/search/leads?status=1&assigned_to=${currentUser.id}');

      if (response is List) {
        // Convert to LeadModel objects first
        List<LeadModel> allLeads = [];
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            allLeads.add(LeadModel.fromJson(item));
          } else if (item is Map) {
            allLeads.add(LeadModel.fromJson(Map<String, dynamic>.from(item)));
          }
        }


        return allLeads;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }



  /// Store leads data in local storage
  Future<void> storeLeadsData(List<LeadModel> leads) async {
    await _storage.write('leadsData', leads.map((e) => e.toJson()).toList());
  }

  /// Get stored leads data
  List<LeadModel>? getStoredLeadsData() {
    final leadsData = _storage.read('leadsData');
    if (leadsData != null) {
      return (leadsData as List)
          .map((item) => LeadModel.fromJson(item))
          .toList();
    }
    return null;
  }

  /// Clear stored leads data
  Future<void> clearLeadsData() async {
    await _storage.remove('leadsData');
  }

  Future<LeadModel> getLeadById(int id) async {
    try {
      final response = await SHttpHelper.get('api/get/leads/$id');

      if (response is Map<String, dynamic>) {
        return LeadModel.fromJson(response);
      } else {
        throw Exception('Invalid response format from server');
      }
    } catch (e) {
      throw Exception('Error fetching lead: $e');
    }
  }
}
