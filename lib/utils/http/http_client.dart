import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:get_storage/get_storage.dart';

class SHttpHelper {
  static const String _baseUrl = 'https://www.bhagwatiassociate.in';
  static Map<String, String> _cookies = {};
  static String? _authToken;

  // Method to store cookies from response headers
  static void _updateCookies(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      String cookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
      List<String> parts = cookie.split('=');
      if (parts.length == 2) {
        _cookies[parts[0]] = parts[1];
      }
    }
  }

  // Get cookie header string
  static String get _cookieHeader {
    return _cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
  }

  // Method to set auth token
  static void setAuthToken(String token) {
    _authToken = token;
  }

  // Method to clear auth token
  static void clearAuthToken() {
    _authToken = null;
  }

  // Get auth headers
  static Map<String, String> get _authHeaders {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  static Future<dynamic> get(String endpoint) async {
    // Get stored token
    final token = _authToken ?? GetStorage().read('token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Check if response is HTML instead of JSON
    if (response.headers['content-type']?.contains('text/html') ?? false) {
      throw Exception(
          'Authentication failed or session expired. Please login again.');
    }

    _updateCookies(response);
    return _handleResponseWithRawData(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    // Get stored token
    final token = _authToken ?? GetStorage().read('token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Check if response is HTML instead of JSON
    if (response.headers['content-type']?.contains('text/html') ?? false) {
      throw Exception(
          'Authentication failed or session expired. Please login again.');
    }

    _updateCookies(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    // Get stored token
    final token = _authToken ?? GetStorage().read('token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Handle redirects
    if (response.statusCode == 302) {
      final location = response.headers['location'];
      if (location != null) {
        // Follow the redirect with the same headers
        final redirectResponse = await http.put(
          Uri.parse(location),
          body: jsonEncode(data),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        );
        _updateCookies(redirectResponse);
        return _handleResponse(redirectResponse);
      }
    }

    _updateCookies(response);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _authHeaders,
    );
    _updateCookies(response);
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    try {
      // Check for non-JSON responses
      final contentType = response.headers['content-type'] ?? '';
      final isJsonResponse = contentType.contains('application/json') ||
          (response.body.startsWith('{') || response.body.startsWith('['));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!isJsonResponse) {
          // If success but not JSON, create a simple success response
          return {
            "success": true,
            "message": "Operation completed successfully"
          };
        }
        return jsonDecode(response.body);
      } else if (response.statusCode == 302) {
        throw Exception('Authentication required. Please login again.');
      } else if (response.statusCode == 400) {
        throw BadRequestException(
            isJsonResponse ? response.body : "Bad request");
      } else if (response.statusCode == 401) {
        throw UnauthorizedException(
            isJsonResponse ? response.body : "Unauthorized");
      } else if (response.statusCode == 404) {
        throw NotFoundException(isJsonResponse ? response.body : "Not found");
      } else if (response.statusCode == 405) {
        throw ForbiddenException(
            "Method not allowed. The server doesn't support this operation.");
      } else if (response.statusCode == 500) {
        throw InternalServerErrorException(
            isJsonResponse ? response.body : "Internal server error");
      } else {
        String errorMsg = 'Failed to load data: ${response.statusCode}';
        if (isJsonResponse) {
          try {
            final errorBody = jsonDecode(response.body);
            if (errorBody['message'] != null) {
              errorMsg = errorBody['message'];
            } else if (errorBody['error'] != null) {
              errorMsg = errorBody['error'];
            }
          } catch (e) {
            errorMsg += ' - Error parsing response';
          }
        } else if (response.body.contains('MethodNotAllowedHttpException')) {
          errorMsg = "Method not allowed. Please check API documentation.";
        } else {
          errorMsg += ' - Non-JSON response received';
        }
        throw Exception(errorMsg);
      }
    } catch (e) {
      if (e is FormatException) {
        throw Exception(
            'Invalid response format: Unable to parse server response');
      }
      rethrow;
    }
  }

  /// -- bearer token

// Get
  static Future<Map<String, dynamic>> getWithToken(
      String endpoint, String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

// Post
  static Future<Map<String, dynamic>> postWithToken(
      String endpoint, dynamic data, String token) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

// Put
  static Future<Map<String, dynamic>> putWithToken(
      String endpoint, dynamic data, String token) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

// Delete
  static Future<Map<String, dynamic>> deleteWithToken(
      String endpoint, String token) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

  // Clear cookies on logout
  static void clearCookies() {
    _cookies.clear();
  }

  // Test different login methods to find which one the server expects
  static Future<Map<String, dynamic>> testLogin(
      String email, String password) async {
    try {
      final response = await post('api/login', {
        'email': email,
        'password': password,
      });
      return response;
    } catch (e) {
      try {
        final response = await get('api/login?email=$email&password=$password');
        return response;
      } catch (e) {
        try {
          final response = await post('login', {
            'email': email,
            'password': password,
          });
          return response;
        } catch (e) {
          try {
            print('Attempting login with GET to /login');
            final response = await get('login?email=$email&password=$password');
            return response;
          } catch (e) {
            print('GET to /login failed: $e');
            rethrow;
          }
        }
      }
    }
  }

  static dynamic _handleResponseWithRawData(http.Response response) {
    try {
      // Check for non-JSON responses
      final contentType = response.headers['content-type'] ?? '';
      final isJsonResponse = contentType.contains('application/json') ||
          (response.body.startsWith('{') || response.body.startsWith('['));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!isJsonResponse) {
          // If success but not JSON, create a simple success response
          return {
            "success": true,
            "message": "Operation completed successfully",
            "rawResponse": response.body
          };
        }

        try {
          // Try to parse as JSON
          final jsonData = jsonDecode(response.body);
          return jsonData;
        } catch (e) {
          print('JSON parse error: $e');
          // If JSON parsing fails, return the raw body
          return {
            "success": false,
            "message": "Failed to parse JSON response",
            "rawResponse": response.body
          };
        }
      } else {
        // Handle error responses
        String errorMsg = 'Failed to load data: ${response.statusCode}';
        if (isJsonResponse) {
          try {
            final errorBody = jsonDecode(response.body);
            if (errorBody['message'] != null) {
              errorMsg = errorBody['message'];
            } else if (errorBody['error'] != null) {
              errorMsg = errorBody['error'];
            }
          } catch (_) {
            errorMsg += ' - Error parsing response';
          }
        }

        throw Exception(errorMsg);
      }
    } catch (e) {
      if (e is FormatException) {
        throw Exception(
            'Invalid response format: Unable to parse server response');
      }
      rethrow;
    }
  }
}
