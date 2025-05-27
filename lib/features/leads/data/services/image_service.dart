import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:path/path.dart' as path;

class ImageService {
  static final ImageService instance = ImageService._internal();

  ImageService._internal();

  /// Upload multiple images for a lead
  Future<List<String>> uploadImages(int leadId, List<File> images) async {
    try {
      List<String> uploadedPaths = [];

      for (var image in images) {
        final fileName = path.basename(image.path);
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('https://bhagwatiassociate.in/api/upload/lead_images'),
        );

        // Add the file to the request
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            filename: fileName,
          ),
        );

        // Add lead_id to the request
        request.fields['lead_id'] = leadId.toString();

        // Get stored token
        final token = GetStorage().read('token');
        if (token == null) {
          throw Exception('Authentication token not found');
        }

        // Add authorization header
        request.headers['Authorization'] = 'Bearer $token';

        final response = await request.send();
        final responseBody = await response.stream.bytesToString();

        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonResponse = jsonDecode(responseBody);
          if (jsonResponse['path'] != null) {
            uploadedPaths.add(jsonResponse['path']);
          }
        } else {
          throw Exception('Failed to upload image: ${response.statusCode}');
        }
      }

      return uploadedPaths;
    } catch (e) {
      print('Error uploading images: $e');
      rethrow;
    }
  }

  /// Get images for a lead
  Future<List<String>> getLeadImages(int leadId) async {
    try {
      final response = await SHttpHelper.get('api/get/lead_images/$leadId');

      if (response is List) {
        return response.map((item) => item['path'] as String).toList();
      } else if (response is Map<String, dynamic> && response['path'] != null) {
        return [response['path'] as String];
      }

      return [];
    } catch (e) {
      print('Error fetching lead images: $e');
      return [];
    }
  }
}
