import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/features/personalization/controllers/user_controller.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/utils/network_manager/network_manager.dart';
import 'package:bhagwatiassociate/utils/popups/full_screen_loader.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'dart:convert';

class loginController extends GetxController {
  static loginController get instance => Get.find();
  final consultantUserController = Get.put(ConsultantUserController());
  // variables
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  // final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var phone = PhoneNumber(countryCode: '', number: '', countryISOCode: '').obs;
  final obscureText = true.obs;
  final Storage = GetStorage(); // Use SLocalStorage

  Future<void> login() async {
    try {
      // start loading
      SFullScreenLoader.openLoadingDialog("login", "");
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SHelperFunctions.showSnackBar('No internet connection');
        SFullScreenLoader.stopLoading();
        return;
      }
      // Validate the form
      if (!loginformKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }
      // Log login attempt
      print("Attempting login with email: ${emailController.text.trim()}");

      // send login request
      final response = await AuthRepository.instance.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Log response
      print("Login response: $response");

      // Handle successful login - check different potential success indicators
      if (response["message"] == "Login successful" ||
          response["success"] == true ||
          response["token"] != null) {
        // Store user details in JSON format
        Map<String, dynamic> userDetails = {
          'id': response['user']?['id'] ?? 0,
          'name': response['user']?['name'] ?? '',
          'email': emailController.text.trim(),
          'token': response['token'] ?? '',
          'login_time': DateTime.now().toIso8601String(),
          'status': response['user']?['status'] ?? 1,
        };
        print('User Details JSON: ${jsonEncode(userDetails)}');

        // Save user details for later use
        Storage.write('userDetails', userDetails);

        // Set auth status
        Storage.write('authStatus', true);
        SFullScreenLoader.stopLoading();
        AuthRepository.instance.screenRedirect();
        SLoader.successSnackBar(
            title: "Success!",
            message: response['message'] ?? "Login successful");
      } else {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(
            title: "Error",
            message: response['message'] ?? 'Login failed. Please try again.');
      }
    } catch (e) {
      SFullScreenLoader.stopLoading();
      if (e is AppException) {
        SLoader.errorSnackBar(title: 'Error', message: e.message.toString());
      } else if (e is BadRequestException) {
        SLoader.errorSnackBar(title: 'Ops!', message: e.message.toString());
      } else {
        print('loginController error: $e');
        SLoader.errorSnackBar(
            title: 'Error', message: 'An error occurred during login');
      }
    }
  }
}
