import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';

class SHttpHelper {
  static const String _baseUrl =
      'https://consultpro-backend.onrender.com/api/v1';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    // print(data);
    print('data posted: ${jsonEncode(data)}');
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    print('response from post: $jsonDecode(response.body) ${response.statusCode}');
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.body);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException(response.body);
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
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
    print(data);
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print(
        'response from postWithToken: ${jsonDecode(response.body)} ${response.statusCode}');
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
}
