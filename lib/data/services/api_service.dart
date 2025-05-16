import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  static ApiService get instance => _instance;

  /// Get all records from a table
  Future<List<Map<String, dynamic>>> getAllRecords(String table) async {
    try {
      final response = await SHttpHelper.get('api/get/$table');
      if (response is List) {
        return List<Map<String, dynamic>>.from(response);
      } else if (response is Map && response.containsKey('data')) {
        return List<Map<String, dynamic>>.from(response['data']);
      }
      return [];
    } catch (e) {
      print('getAllRecords error: $e');
      return [];
    }
  }

  /// Get a record by ID
  Future<Map<String, dynamic>> getRecordById(String table, int id) async {
    try {
      final response = await SHttpHelper.get('api/get/$table/$id');
      if (response is Map<String, dynamic>) {
        return response;
      }
      return {'id': id};
    } catch (e) {
      print('getRecordById error: $e');
      return {'id': id, 'error': e.toString()};
    }
  }

  /// Get records filtered by a field value
  Future<List<Map<String, dynamic>>> getRecordsByField(
      String table, String field, dynamic value) async {
    try {
      final response = await SHttpHelper.get('api/get/$table/$field/$value');

      print('API response for $table/$field/$value: $response');
      // Empty list to be returned in case of any issues
      final List<Map<String, dynamic>> emptyList = [];

      if (response is List) {
        try {
          // Convert each item in the list to a Map<String, dynamic>
          final result = <Map<String, dynamic>>[];
          final List<dynamic> responseList = response as List<dynamic>;
          for (dynamic item in responseList) {
            if (item is Map<String, dynamic>) {
              result.add(item);
            } else if (item is Map) {
              result.add(Map<String, dynamic>.from(item));
            } else {
              print('Skipping invalid item in list: $item');
            }
          }
          return result;
        } catch (e) {
          print('Error converting list response: $e');
          return emptyList;
        }
      } else if (response is Map) {
        final Map<dynamic, dynamic> responseMap = response;

        // Special case: Handle success response with no data
        if (responseMap.containsKey('success') &&
            responseMap.containsKey('message')) {
          // The API returned a success message but no data, wrap it in a list with a single item
          // so the calling code can check for this special case
          return [Map<String, dynamic>.from(responseMap)];
        }

        if (responseMap.containsKey('data')) {
          try {
            final dynamic dataValue = responseMap['data'];
            if (dataValue is List) {
              final List<dynamic> dataList = dataValue;
              return List<Map<String, dynamic>>.from(dataList.map((item) {
                if (item is Map<String, dynamic>) {
                  return item;
                } else if (item is Map) {
                  return Map<String, dynamic>.from(item);
                } else {
                  print('Invalid item in data list: $item');
                  return <String, dynamic>{};
                }
              }).where((item) => item.isNotEmpty));
            } else {
              print('Data is not a List: $dataValue');
              return emptyList;
            }
          } catch (e) {
            print('Error converting data list: $e');
            return emptyList;
          }
        } else {
          print('Map does not contain "data" key: $responseMap');
          // Return a wrapper containing the response to let the caller handle it
          return [Map<String, dynamic>.from(responseMap)];
        }
      } else {
        print('Unexpected response format: $response');
        return emptyList;
      }
    } catch (e) {
      print('getRecordsByField error: $e');
      return []; // Return empty list rather than throwing
    }
  }

  /// Add a new record
  Future<Map<String, dynamic>> addRecord(
      String table, Map<String, dynamic> data) async {
    try {
      final response = await SHttpHelper.post('api/add/$table', data);
      return response;
    } catch (e) {
      print('addRecord error: $e');
      return {'error': e.toString()};
    }
  }

  /// Update a record
  Future<Map<String, dynamic>> updateRecord(
      String table, int id, Map<String, dynamic> data) async {
    try {
      final response = await SHttpHelper.put('api/update/$table/$id', data);
      return response;
    } catch (e) {
      print('updateRecord error: $e');
      return {'error': e.toString()};
    }
  }

  /// Delete a record
  Future<Map<String, dynamic>> deleteRecord(String table, int id) async {
    try {
      final response = await SHttpHelper.delete('api/delete/$table/$id');
      return response;
    } catch (e) {
      print('deleteRecord error: $e');
      return {'error': e.toString()};
    }
  }

  /// Fetch raw API data for debugging
  Future<dynamic> getRawApiResponse(String endpoint) async {
    try {
      // First log the API endpoint we're trying to access
      print('Attempting to access raw API endpoint: $endpoint');

      try {
        final response = await SHttpHelper.get(endpoint);
        print('Raw API response type: ${response.runtimeType}');
        print('Raw API response: $response');
        return response;
      } catch (e) {
        print('HTTP error in getRawApiResponse: $e');

        // Try a more direct approach
        print('Attempting alternate approach...');
        try {
          final inspectResponse =
              await SHttpHelper.get('api/inspect/$endpoint');
          print('Inspect response: $inspectResponse');
          return inspectResponse;
        } catch (innerE) {
          print('Alternate approach also failed: $innerE');
          return null;
        }
      }
    } catch (e) {
      print('Error fetching raw API data: $e');
      return null;
    }
  }
}
