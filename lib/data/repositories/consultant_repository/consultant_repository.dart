import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';

class ConsultantRepository extends GetxController {
  static ConsultantRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  late final String _token;

  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserDetailsToLocal(ConsultantUserDataModel user) async {
    // save user record
    try {
      deviceStorage.write('profileData', user.toJson());
    } catch (e) {
      throw 'Data not Saved';
    }
  }

  // Future<void> updateUserDetails(ConsultantUserDataModel user) async {
  //   /// --  save user record to local and remote
  //   try {
  //     // send post request to save user data
  //     deviceStorage.write('profileData', user.toJson());
  //   } catch (e) {
  //     throw 'Data not Saved';
  //   }
  // }
  // Future<void> saveUserRecord(UserModel user) async {
  //   // save user record
  //   try {
  //     await _db.collection('Users').doc(user.id).set(user.toJson());
  //   } catch (e) {
  //     throw 'Data not Saved';
  //   }
  // }

  Future<ConsultantUserDataModel> fetchUserDetails(
      {bool forceRefresh = false}) async {
    try {
      // Check if user data is available in cache and forceRefresh is false
      if (!forceRefresh) {
        final cachedUserData = deviceStorage.read('profileData');
        _token = deviceStorage.read('token');
        if (cachedUserData != null) {
          // Return cached user data
          return ConsultantUserDataModel.fromJson(cachedUserData);
        }
      }
      // If not in cache or forceRefresh is true, make an API call to fetch user data
      final response = await _fetchUserDataFromApi();
      if (response['token'] != null) {
        // Update cache with fetched data
        deviceStorage.write('profileData', response['consultant']);
        _token = response['token'];
        deviceStorage.write('token', _token);
        return ConsultantUserDataModel.fromJson(response['consultant']);
      } else {
        throw 'Failed to fetch user data from API';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  // fetch user data from api
  Future<Map<String, dynamic>> _fetchUserDataFromApi() async {
    try {
      final response = await SHttpHelper.getWithToken('user/profile', _token);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  // Future<UserModel> fetchUserDetails() async {
  //   // get user record
  //   try {
  //     final documentSnapshot = await _db
  //         .collection('Users')
  //         .doc(AuthenticationRepository.instance.authUser?.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       return UserModel.fromSnapshot(documentSnapshot);
  //     } else {
  //       return UserModel.empty();
  //     }
  //   } catch (e) {
  //     throw 'error : $e';
  //   }
  // }

  // Future<void> updateUserDetails(UserModel updatedUser) async {
  //   // update user record
  //   try {
  //     await _db
  //         .collection('Users')
  //         .doc(updatedUser.id)
  //         .update(updatedUser.toJson());
  //   } catch (e) {
  //     throw 'error : $e';
  //   }
  // }

  Future<ConsultantUserDataModel> updateSingleUserField(
      Map<String, dynamic> jsonOfUpdateField) async {
    // ṣtring return sucess message
    // update single user field
    try {
      final response = await SHttpHelper.putWithToken(
          'user/profile', jsonOfUpdateField, _token);
      saveUserDetailsToLocal(response['consultant']);
      return ConsultantUserDataModel.fromJson(response['consultant']);
    } catch (e) {
      throw 'error : $e';
    }
  }

  // Future<void> deleteUserRecord() async {
  //   // delete user record
  //   try {
  //     await _db
  //         .collection('Users')
  //         .doc(AuthenticationRepository.instance.authUser?.uid)
  //         .delete();
  //   } catch (e) {
  //     throw 'error : $e';
  //   }
  // }

  // Future<String> uploadImage(String path, XFile image) async {
  //   // upload image
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     throw 'error : $e';
  //   }
  // }
}
