import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/features/auth/data/models/registrationdatamodel.dart';
import 'package:bhagwatiassociate/features/auth/screens/verifyOTP/verifyotp.dart';
import 'package:bhagwatiassociate/utils/constants/enums.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/utils/network_manager/network_manager.dart';
import 'package:bhagwatiassociate/utils/popups/full_screen_loader.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

// variables
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final dobController = TextEditingController();
  final gender = ''.obs;
  final acceptTermsAndConditions = false.obs;
  final obscureText = true.obs;

  var phone = PhoneNumber(countryCode: '', number: '', countryISOCode: '').obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var registrationData = Registrationdatamodel.empty();
  // final TextEditingController mobileNumberController = TextEditingController();
  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dobController.text = pickedDate.toIso8601String().split('T').first;
    }
  }

  Future<void> submitForm() async {
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
      // Validate the form
      if (!signUpFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }
      // T&C check
      if (!acceptTermsAndConditions.value) {
        SLoader.warningSnackBar(
            title: 'Accept privacy policy',
            message:
                'In order to proceed, you must have to read and accept the privacy policy & terms and use.');
        SFullScreenLoader.stopLoading();
        return;
      }
      //

      // Create an instance of Registrationdatamodel
      registrationData = Registrationdatamodel(
        fullName:
            '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
        email: emailController.text.trim(),
        mobileNumber: '${phone.value.countryCode}${phone.value.number}',
        dateOfBirth: DateTime.parse(dobController.text.trim()),
        gender: gender.value,
        password: passwordController.text.trim(),
        acceptTermsAndConditions: acceptTermsAndConditions.value,
        role: 'consultant',
        availabilityStatus: availablityStatus.NotAvailable,
      );
      print('${phone.value.countryCode}${phone.value.number}');
      print(registrationData.toJson());

      // request otp from the server
      final response = await AuthRepository.instance
          .requestOtp(registrationDataModel: registrationData);
      // For example, you can call an API to register the user

      // it will contain ,message and status
      if (response['message'] != null) {
        SFullScreenLoader.stopLoading();
        SLoader.successSnackBar(title: "Hurry!", message: response['message']);

        Get.to(() => const VerifyOtp());
        return;
      } else {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(title: 'oh snap!', message: response.toString());
        print(response.toString());
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
        print('registerationController error: $e');
      }
    }
  }
}
