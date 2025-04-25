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
    // Implement your login logic here, e.g., validate credentials,
    // navigate to the next screen, or show an error message.
    print('Login button pressed');

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
      // send lgin request
      final response = await AuthRepository.instance.loginUser(
        mobileNumber: '${phone.value.countryCode}${phone.value.number}',
        password: passwordController.text.trim(),
      );
      print("response from auth.loginUSer$response");
      if (response["token"] != null) {
        consultantUserController.user.value =
            ConsultantUserDataModel.fromJson(response["consultant"]);
        // save user data
        consultantUserController.saveUserRecordToLocal();
        // Storage.write('profileData', response["consultant"]);
        Storage.write('token', response["token"]);
        Storage.write('authStatus', true);
        SFullScreenLoader.stopLoading();
        AuthRepository.instance.screenRedirect();
        SLoader.successSnackBar(
            title: "Hurry!",
            message: response['message'] ?? "Login successful");
      } else {
        SFullScreenLoader.stopLoading();
        SLoader.errorSnackBar(
            title: "Error",
            message: response['message'] ?? 'Login failed. Please try again.');
      }
      // save user data
      // final user = UserModel.fromJson(response['data']);
      // await SLocalStorage.instance.saveUserData(user);
      // SHelperFunctions.showSnackBar('Login successful');
      // Get.offAll(() => const NavigationMenu());
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
        print('loginController error: $e');
      }
    }
  }

}
