import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/features/auth/controllers/registration/registercontroller.dart';
import 'package:bhagwatiassociate/features/personalization/controllers/user_controller.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/utils/network_manager/network_manager.dart';
import 'package:bhagwatiassociate/utils/popups/full_screen_loader.dart';

class VerifyOtpController extends GetxController {
  static VerifyOtpController get instance => Get.find();
  static ConsultantUserController get consultantUserController => Get.find();
  var remainingTime = 90.obs; // Set initial countdown time to 90 seconds

  late Timer _timer;

  final registrationData = RegisterController.instance.registrationData;
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();
  final TextEditingController pin5Controller = TextEditingController();
  final TextEditingController pin6Controller = TextEditingController();

  final storage = GetStorage(); // Use SLocalStorage

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer.cancel();
      }
    });
  }

  Future<void> sendVerifyOtpRequest() async {
    final otp = pin1Controller.text +
        pin2Controller.text +
        pin3Controller.text +
        pin4Controller.text +
        pin5Controller.text +
        pin6Controller.text;

    // Validate OTP length before sending the request
    if (otp.length != 6) {
      Get.snackbar(
        'OPs!', // Title
        'Please enter a 6-digit OTP.',
        snackPosition: SnackPosition.BOTTOM,
        // animationDuration: const Duration(milliseconds: 10),
      );
      return;
    }

    registrationData.otpCode = otp;
    try {
      // start loading
      SFullScreenLoader.openLoadingDialog('Registering you :)', "");
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SHelperFunctions.showSnackBar('No internet connection');
        SFullScreenLoader.stopLoading();
        return;
      }
      // request otp from the server
      final response = await AuthRepository.instance
          .verifyOtp(registrationDataModel: registrationData);
      // For example, you can call an API to register the user

      if (response['token'] != null) {
        print(response.toString());
        consultantUserController.user.value =
            ConsultantUserDataModel.fromJson(response["consultant"]);
        // save user data
        consultantUserController.saveUserRecordToLocal();
        // storage.write('profileData', response["consultant"]);
        storage.write('token', response["token"]);
        storage.write('authStatus', true);
        SFullScreenLoader.stopLoading();
        AuthRepository.instance.screenRedirect();
        SLoader.successSnackBar(title: "Hurry!", message: response['message']);

        return;
      } else {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(title: 'oh snap!', message: response.toString());
      }
    } catch (e) {
      // SFullScreenLoader.stopLoading();
      if (e is AppException) {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(title: 'Error', message: e.message.toString());
        // Get.snackbar('Error', e.toString());
      } else if (e is BadRequestException) {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(title: 'Ops!', message: e.message.toString());
        // Get.snackbar('Error', e.toString());
      } else {
        print('verifyOtpController error: $e');
      }
    }
    // } catch (e) {
    //   if (e is AppException) {
    //     Get.snackbar('Error', e.toString());
    //   } else if (e is BadRequestException) {
    //     SLoader.errorSnackBar(
    //         title: 'Ops!', message: "Invalid OTP. Please try again.");
    //   } else {
    //     // Handle unexpected exceptions
    //     // Get.snackbar(
    //     //   'Error',
    //     //   'Failed to verify OTP. Please try again.',
    //     //   snackPosition: SnackPosition.BOTTOM,
    //     // );
    //     SFullScreenLoader.stopLoading();
    //     SLoader.errorSnackBar(title: 'oh snap!', message: e.toString());
    //   }

    //   // Check if the status code indicates success
    // }
  }

  Future<void> resendOtp() async {
    if (remainingTime.value == 0) {
      // Logic for resending the OTP
      registrationData.otpCode = ""; // Reset the OTP code

      try {
        final response = await AuthRepository.instance
            .requestOtp(registrationDataModel: registrationData);

        if (response['message'] != null) {
          SFullScreenLoader.stopLoading();
          SLoader.successSnackBar(
              title: "'OTP has been resent.", message: response['message']);
          remainingTime.value = 90; // Reset the timer
          _startCountdown();
        }
      } catch (e) {
        SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
      }
      // Get.snackbar(
      //   'Info',
      //   'OTP has been resent.',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
