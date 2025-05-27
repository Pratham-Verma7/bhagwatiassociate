import 'package:bhagwatiassociate/features/leads/data/models/employee_address_verification_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class EmployeeAddressVerificationService {
  static final EmployeeAddressVerificationService instance =
      EmployeeAddressVerificationService._internal();

  EmployeeAddressVerificationService._internal();

  /// Get employee address verification by lead ID
  Future<EmployeeAddressVerificationModel?> getVerificationByLeadId(
      int leadId) async {
    try {
      final response = await SHttpHelper.get(
          'api/get/employee_address_verifications/$leadId');

      if (response is Map<String, dynamic>) {
        return EmployeeAddressVerificationModel.fromJson(response);
      } else if (response is List && response.isNotEmpty) {
        // If response is a list, take the first item (most recent)
        if (response[0] is Map<String, dynamic>) {
          return EmployeeAddressVerificationModel.fromJson(response[0]);
        }
      }

      // If no verification found, return null
      return null;
    } catch (e) {
      print("Error fetching employee address verification: $e");
      return null;
    }
  }

  /// Submit employee address verification data
  Future<bool> submitVerification(
      EmployeeAddressVerificationModel verification) async {
    try {
      final data = verification.toJson();

      // If we have an ID, update existing record
      if (verification.id != null) {
        final response = await SHttpHelper.put(
            'api/update/employee_address_verifications/${verification.id}',
            data);
        return response['success'] == true;
      } else {
        // Otherwise create a new record
        final response = await SHttpHelper.post(
            'api/add/employee_address_verifications', data);
        return response['success'] == true;
      }
    } catch (e) {
      print("Error submitting employee address verification: $e");
      return false;
    }
  }
}
