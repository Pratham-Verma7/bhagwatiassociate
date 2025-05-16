import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

/// A service for generic table operations using the API endpoint pattern api/get/{table}/{id}
class GenericTableService {
  static final GenericTableService _instance = GenericTableService._internal();
  factory GenericTableService() => _instance;
  GenericTableService._internal();

  static GenericTableService get instance => _instance;

  // Get Storage instance for user details
  final _storage = GetStorage();

  /// Fetches data from any table by ID using the API endpoint api/get/{table}/{id}
  Future<Map<String, dynamic>?> getRecordById(String tableName, int id) async {
    try {
      print('Fetching record from $tableName with ID: $id');
      final response = await SHttpHelper.get('api/get/$tableName/$id');

      if (response is Map<String, dynamic>) {
        if (response.containsKey('data')) {
          var data = response['data'];
          if (data is Map<String, dynamic>) {
            return data;
          } else if (data is List && data.isNotEmpty) {
            return data[0] as Map<String, dynamic>;
          }
        } else {
          return response;
        }
      }
      return null;
    } catch (e) {
      print('Error in getRecordById for $tableName/$id: $e');
      return null;
    }
  }

  /// Fetches all records from any table using the API endpoint api/get/{table}
  Future<List<Map<String, dynamic>>?> getAllRecords(String tableName) async {
    try {
      print('Fetching all records from $tableName');
      final response = await SHttpHelper.get('api/get/$tableName');

      if (response is List) {
        return List<Map<String, dynamic>>.from(response);
      } else if (response is Map && response.containsKey('data')) {
        return List<Map<String, dynamic>>.from(response['data']);
      }
      return [];
    } catch (e) {
      print('Error in getAllRecords for $tableName: $e');
      return [];
    }
  }

  /// Adds a record to any table using the API endpoint api/add/{table}
  Future<Map<String, dynamic>> addRecord(
      String tableName, Map<String, dynamic> data) async {
    try {
      final response = await SHttpHelper.post('api/add/$tableName', data);
      return response;
    } catch (e) {
      print('Error in addRecord for $tableName: $e');
      return {'error': e.toString()};
    }
  }

  /// Updates a record in any table using the API endpoint api/update/{table}/{id}
  Future<Map<String, dynamic>> updateRecord(
      String tableName, int id, Map<String, dynamic> data) async {
    try {
      final response = await SHttpHelper.put('api/update/$tableName/$id', data);
      return response;
    } catch (e) {
      print('Error in updateRecord for $tableName/$id: $e');
      return {'error': e.toString()};
    }
  }

  /// Deletes a record from any table using the API endpoint api/delete/{table}/{id}
  Future<Map<String, dynamic>> deleteRecord(String tableName, int id) async {
    try {
      final response = await SHttpHelper.delete('api/delete/$tableName/$id');
      return response;
    } catch (e) {
      print('Error in deleteRecord for $tableName/$id: $e');
      return {'error': e.toString()};
    }
  }

  /// Gets the currently logged in user ID from storage
  int? getCurrentUserId() {
    final userDetails = _storage.read('userDetails');
    if (userDetails != null && userDetails.containsKey('id')) {
      return userDetails['id'];
    }
    return null;
  }
}
