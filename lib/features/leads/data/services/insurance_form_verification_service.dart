import 'package:bhagwatiassociate/features/leads/data/models/insurance_form_verification_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class InsuranceFormVerificationService {
  static final InsuranceFormVerificationService instance =
      InsuranceFormVerificationService._internal();

  InsuranceFormVerificationService._internal();

  /// Get insurance form verification by lead ID
  Future<InsuranceFormVerificationModel?> getVerificationByLeadId(
      int leadId) async {
    try {
      final response =
          await SHttpHelper.get('api/get/insurance_forms/lead_id/$leadId');

      if (response is Map<String, dynamic>) {
        return InsuranceFormVerificationModel.fromJson(response);
      } else if (response is List && response.isNotEmpty) {
        // If response is a list, take the first item (most recent)
        if (response[0] is Map<String, dynamic>) {
          return InsuranceFormVerificationModel.fromJson(response[0]);
        }
      }

      // If no verification found, return null
      return null;
    } catch (e) {
      print("Error fetching insurance form verification: $e");
      return null;
    }
  }

  /// Submit insurance form verification data
  Future<bool> submitVerification(
      InsuranceFormVerificationModel verification) async {
    try {
      final data = verification.toJson();

      // If we have an ID, update existing record
      if (verification.id != null) {
        final response = await SHttpHelper.put(
            'api/update/insurance_forms/${verification.id}', data);
        return response['success'] == true;
      } else {
        // Otherwise create a new record
        final response =
            await SHttpHelper.post('api/add/insurance_forms', data);
        return response['success'] == true;
      }
    } catch (e) {
      print("Error submitting insurance form verification: $e");
      return false;
    }
  }
}
