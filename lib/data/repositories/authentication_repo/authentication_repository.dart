import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/features/auth/data/models/registrationdatamodel.dart';
import 'package:bhagwatiassociate/features/auth/data/models/user_model.dart';
import 'package:bhagwatiassociate/features/auth/data/services/user_service.dart';
import 'package:bhagwatiassociate/features/auth/screens/login/loginscreen.dart';

import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/features/Dashboard/screens/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _userService = UserService.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    // final User = _auth.currentUser;

    /// -- initialize the auth status & first time
    deviceStorage.writeIfNull('authStatus', false);
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.writeIfNull('profileData', {"_id": "NULL"});
    // deviceStorage.writeIfNull('profileData', {"ID": {}});
    deviceStorage.writeIfNull('token', '');

    // for debugging
    // deviceStorage.write('authStatus', false);
    // deviceStorage.write('IsFirstTime', true);

    /// -- check if user is already signed in
    if (deviceStorage.read('authStatus') == true) {
      Get.offAll(() => const DashboardScreen());
    } else {
      Get.offAll(() => const loginScreen());
    }

    // if (User != null) {
    //   // User is signed in
    //   Get.offAll(() => const NavigationMenu());
    // } else {

    //   // check if its first time
    // deviceStorage.read('IsFirstTime') != true
    //     ? Get.offAll(() => const loginScreen()) :

    // }
  }

/*----------------Register-----------------*/
  Future<Map<String, dynamic>> requestOtp({
    required Registrationdatamodel registrationDataModel,
  }) async {
    try {
      return await SHttpHelper.post(
          'auth/register', registrationDataModel.toJson());
    } catch (e) {
      rethrow;
      // SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required Registrationdatamodel registrationDataModel,
  }) async {
    try {
      return await SHttpHelper.post(
          'auth/register/verifyotp', registrationDataModel.toJson());
    } catch (e) {
      // SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
      rethrow;
    }
  }

/*----------------Login-----------------*/

  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      print('Attempting login with email: $email');

      // First get the authentication token
      final loginResponse = await SHttpHelper.post('api/login', {
        'email': email,
        'password': password,
      });

      if (loginResponse.containsKey('token')) {
        // Store the token
        SHttpHelper.setAuthToken(loginResponse['token']);
        deviceStorage.write('token', loginResponse['token']);

        // Get all users
        final usersResponse = await SHttpHelper.get('api/get/users');

        // Find the user with matching email
        UserModel? matchedUser;
        if (usersResponse is List) {
          for (var userData in usersResponse) {
            if (userData['email'] == email) {
              matchedUser = UserModel.fromJson({
                'id': userData['id'],
                'name': userData['name'],
                'email': userData['email'],
                'token': loginResponse['token'],
                'login_time': userData['login_time'],
                'status': userData['status']
              });
              break;
            }
          }
        }

        if (matchedUser != null) {
          // Store user data
          await _userService.storeUserData(matchedUser);
          deviceStorage.write('authStatus', true);

          print('User Details JSON: ${matchedUser.toJson()}');
          print('User ID: ${matchedUser.id}');

          return {
            'success': true,
            'user': matchedUser.toJson(),
            'token': loginResponse['token']
          };
        } else {
          throw Exception('User not found in the system');
        }
      } else {
        throw Exception('Login failed: No token received');
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }
// Future<void> loginUser({
//   required String email,
//   required String password,
// }) async {
//   try {
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//   } catch (e) {
//     SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
//   }
// }

/* --------------- federated identity & social sign-in ------------------ */

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await userAccount?.authentication;

//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

//     return await _auth.signInWithCredential(credential);
//   } catch (e) {
//     SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
//   }
//   return null;
// }

/*             sign out                */
  Future<void> signOut() async {
    SHttpHelper.clearAuthToken();
    await _userService.clearUserData();
    deviceStorage.write('authStatus', false);
    // deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.write('profileData', {"_id": "NULL"});
    // deviceStorage.writeIfNull('profileData', {"ID": {}});
    deviceStorage.write('token', '');

    Get.offAll(() => const loginScreen());
    SLoader.successSnackBar(
        title: 'Success', message: 'Logged out successfully');
  }

  Future<void> deleteAccount() async {
    try {
      final response = await SHttpHelper.get('api/user/delete');

      if (response['message'] != null || response['success'] == true) {
        await signOut();
        SLoader.successSnackBar(
            title: 'Success',
            message: response['message'] ?? 'Account deleted successfully');
      }
    } catch (e) {
      throw 'Unable to delete account: ${e.toString()}';
    }
  }
}
