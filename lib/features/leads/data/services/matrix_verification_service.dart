import 'package:bhagwatiassociate/features/leads/data/models/matrix_verification_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class MatrixVerificationService {
  static final MatrixVerificationService instance =
      MatrixVerificationService._internal();

  MatrixVerificationService._internal();

  /// Get matrix verification by lead ID
  Future<MatrixVerificationModel?> getVerificationByLeadId(int leadId) async {
    try {
      final response =
          await SHttpHelper.get('api/get/matrix_verifications/lead_id/$leadId');

      if (response is Map<String, dynamic>) {
        return MatrixVerificationModel.fromJson(response);
      } else if (response is List && response.isNotEmpty) {
        // If response is a list, take the first item (most recent)
        if (response[0] is Map<String, dynamic>) {
          return MatrixVerificationModel.fromJson(response[0]);
        }
      }

      // If no verification found, return null
      return null;
    } catch (e) {
      print("Error fetching matrix verification: $e");
      return null;
    }
  }

  /// Submit matrix verification data
  Future<bool> submitVerification(MatrixVerificationModel verification) async {
    try {
      final data = verification.toJson();

      // If we have an ID, update existing record
      if (verification.id != null) {
        final response = await SHttpHelper.put(
            'api/update/matrix_verifications/${verification.id}', data);
        return response['success'] == true;
      } else {
        // Otherwise create a new record
        final response =
            await SHttpHelper.post('api/add/matrix_verifications', data);
        return response['success'] == true;
      }
    } catch (e) {
      print("Error submitting matrix verification: $e");
      return false;
    }
  }
}
