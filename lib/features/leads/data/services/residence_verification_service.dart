import 'package:bhagwatiassociate/features/leads/data/models/residence_verification_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class ResidenceVerificationService {
  static final ResidenceVerificationService instance =
      ResidenceVerificationService._internal();

  ResidenceVerificationService._internal();

  /// Get residence verification by lead ID
  Future<ResidenceVerificationModel?> getVerificationByLeadId(
      int leadId) async {
    try {
      final response = await SHttpHelper.get(
          'api/get/residence_lead_verifications/lead_id/$leadId');

      if (response is Map<String, dynamic>) {
        return ResidenceVerificationModel.fromJson(response);
      } else if (response is List && response.isNotEmpty) {
        // If response is a list, take the first item (most recent)
        if (response[0] is Map<String, dynamic>) {
          return ResidenceVerificationModel.fromJson(response[0]);
        }
      }

      // If no verification found, return null
      return null;
    } catch (e) {
      print("Error fetching residence verification: $e");
      return null;
    }
  }

  /// Submit residence verification data
  Future<bool> submitVerification(
      ResidenceVerificationModel verification) async {
    try {
      final data = verification.toJson();

      // If we have an ID, update existing record
      if (verification.id != null) {
        final response = await SHttpHelper.put(
            'api/update/residence_lead_verifications/${verification.id}', data);
        return response['success'] == true;
      } else {
        // Otherwise create a new record
        final response = await SHttpHelper.post(
            'api/add/residence_lead_verifications', data);
        return response['success'] == true;
      }
    } catch (e) {
      print("Error submitting residence verification: $e");
      return false;
    }
  }
}
