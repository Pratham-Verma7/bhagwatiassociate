import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:path/path.dart' as path;

class ImageService {
  static final ImageService instance = ImageService._internal();

  ImageService._internal();

  /// Validate image file
  Future<bool> _validateImage(File image) async {
    try {
      // Check file size (10MB limit)
      final fileSize = await image.length();
      if (fileSize > 10 * 1024 * 1024) {
        // 10MB in bytes
        throw Exception('Image size exceeds 10MB limit');
      }

      // Check file extension
      final extension = path.extension(image.path).toLowerCase();
      if (!['.jpg', '.jpeg', '.png', '.pdf', '.doc', '.docx']
          .contains(extension)) {
        throw Exception(
            'Invalid file format. Supported formats: jpg, jpeg, png, pdf, doc, docx');
      }

      // Try to read the file to validate it's not corrupted
      final bytes = await image.readAsBytes();
      if (bytes.isEmpty) {
        throw Exception('Invalid image file: File is empty');
      }

      // For images, try to validate the header bytes
      if (['.jpg', '.jpeg', '.png'].contains(extension)) {
        // Check for JPEG header
        if (['.jpg', '.jpeg'].contains(extension)) {
          if (bytes.length < 2 || bytes[0] != 0xFF || bytes[1] != 0xD8) {
            throw Exception('Invalid JPEG file: Invalid header');
          }
        }
        // Check for PNG header
        else if (extension == '.png') {
          if (bytes.length < 8 ||
              bytes[0] != 0x89 ||
              bytes[1] != 0x50 ||
              bytes[2] != 0x4E ||
              bytes[3] != 0x47) {
            throw Exception('Invalid PNG file: Invalid header');
          }
        }
      }

      return true;
    } catch (e) {
      print('Image validation error: $e');
      rethrow;
    }
  }

  /// Upload a single image file
  Future<String> _uploadSingleImage(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://www.bhagwatiassociate.in/api/upload'),
    );

    // Add the file to the request
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
      ),
    );

    // Get stored token
    final token = GetStorage().read('token');
    if (token == null) {
      throw Exception('Authentication token not found');
    }

    // Add headers
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseBody);
      if (jsonResponse['status'] == true && jsonResponse['file_url'] != null) {
        return jsonResponse['file_url'];
      } else {
        throw Exception(jsonResponse['message'] ?? 'Failed to upload image');
      }
    } else if (response.statusCode == 400) {
      final jsonResponse = jsonDecode(responseBody);
      final errorMessage =
          jsonResponse['message'] ?? 'Invalid file format or size';
      throw Exception(errorMessage);
    } else {
      throw Exception('Failed to upload image: ${response.statusCode}');
    }
  }

  /// Upload a single image file specifically for offline syncing
  Future<String> uploadSingleImageForSync(File image) async {
    // You might want to add specific validation or error handling here for sync
    // but for now, we'll just use the internal upload method.
    return _uploadSingleImage(image);
  }

  /// Upload multiple images for a lead
  Future<List<String>> uploadImages(int leadId, List<File> images) async {
    try {
      List<String> uploadedPaths = [];

      for (var image in images) {
        // Validate image before upload
        await _validateImage(image);

        // Use the new single image upload method
        final imageUrl = await _uploadSingleImage(image);
        uploadedPaths.add(imageUrl);
      }

      return uploadedPaths;
    } catch (e) {
      print('Error uploading images: $e');
      rethrow;
    }
  }


}
