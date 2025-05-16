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
      print("Starting getLeadsByUserId to get status=0 leads...");

      // Get current user first
      final userData = _storage.read('userDetails');
      if (userData == null) {
        print("User not authenticated - userData is null");
        throw Exception('User not authenticated');
      }

      final currentUser = UserModel.fromJson(userData);
      if (currentUser.id == null) {
        print("User ID not found in currentUser");
        throw Exception('User ID not found');
      }

      print("User ID: ${currentUser.id}");

      // Get all leads and filter for status=0
      final response = await SHttpHelper.get('api/get/leads');

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

        print("Total leads converted to LeadModel: ${allLeads.length}");

        // Filter leads where status = 0 AND assignedTo = currentUser.id
        final List<LeadModel> statusZeroLeads = allLeads
            .where((lead) => lead.status == 1)
            .where((lead) => lead.assignedTo == currentUser.id)
            .toList();

        print(
            "Leads with status=0 and assigned to user ${currentUser.id}: ${statusZeroLeads.length}");

        return statusZeroLeads;
      } else {
        print("Response is not a List");
        return [];
      }
    } catch (e) {
      print("Error in getLeadsByUserId: $e");
      return [];
    }
  }

  /// Legacy method to get leads by user ID
  Future<List<LeadModel>> _getLeadsByUserIdLegacy() async {
    try {
      print("Starting legacy getLeadsByUserId method...");
      final response = await SHttpHelper.get('api/get/leads');

      if (response is List && response.isNotEmpty) {
        print("Response is a List with ${response.length} items");
      } else {
        print("Response is not a List or is empty");
        return [];
      }

      if (response is List) {
        // Get current user
        final userData = _storage.read('userDetails');
        if (userData == null) {
          throw Exception('User not authenticated');
        }

        final currentUser = UserModel.fromJson(userData);
        if (currentUser.id == null) {
          throw Exception('User ID not found');
        }

        // Convert to LeadModel objects first
        List<LeadModel> allLeads = [];
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            allLeads.add(LeadModel.fromJson(item));
          } else if (item is Map) {
            allLeads.add(LeadModel.fromJson(Map<String, dynamic>.from(item)));
          }
        }

        // Try multiple approaches to filtering leads

        // Approach 1: Filter only by assignedTo (ignoring status)
        final List<LeadModel> filteredByAssignedTo = allLeads
            .where((lead) => lead.assignedTo == currentUser.id)
            .toList();

        // Approach 2: Filter by status 0 or "0" regardless of assignedTo
        final List<LeadModel> filteredByStatus = allLeads
            .where((lead) => lead.status == 0 || lead.status == null)
            .toList();

        print("Filtered by assignedTo count: ${filteredByAssignedTo.length}");
        print("Filtered by status=0 count: ${filteredByStatus.length}");

        // Return leads with status=0 only
        return filteredByStatus;
      } else {
        throw Exception('Invalid response format from server');
      }
    } catch (e) {
      print("Error in _getLeadsByUserIdLegacy: $e");
      throw Exception('Error fetching leads: $e');
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
