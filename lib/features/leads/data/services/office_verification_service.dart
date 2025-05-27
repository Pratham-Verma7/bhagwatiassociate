import 'package:bhagwatiassociate/features/leads/data/models/office_verification_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class OfficeVerificationService {
  static final OfficeVerificationService instance =
      OfficeVerificationService._internal();

  OfficeVerificationService._internal();

  /// Get office verification by lead ID
  Future<OfficeVerificationModel?> getVerificationByLeadId(int leadId) async {
    try {
      final response =
          await SHttpHelper.get('api/get/office_lead_verifications/$leadId');

      if (response is Map<String, dynamic>) {
        return OfficeVerificationModel.fromJson(response);
      } else if (response is List && response.isNotEmpty) {
        // If response is a list, take the first item (most recent)
        if (response[0] is Map<String, dynamic>) {
          return OfficeVerificationModel.fromJson(response[0]);
        }
      }

      // If no verification found, return null
      return null;
    } catch (e) {
      print("Error fetching office verification: $e");
      return null;
    }
  }

  /// Submit office verification data
  Future<bool> submitVerification(OfficeVerificationModel verification) async {
    try {
      final data = verification.toJson();

      // If we have an ID, update existing record
      if (verification.id != null) {
        final response = await SHttpHelper.put(
            'api/update/office_lead_verifications/${verification.id}', data);
        return response['success'] == true;
      } else {
        // Otherwise create a new record
        final response =
            await SHttpHelper.post('api/add/office_lead_verifications', data);
        return response['success'] == true;
      }
    } catch (e) {
      print("Error submitting office verification: $e");
      return false;
    }
  }
}
