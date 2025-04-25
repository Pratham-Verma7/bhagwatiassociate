import 'package:get/get.dart';
import 'package:bhagwatiassociate/data/repositories/consultant_repository/consultant_repository.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';

class ConsultantUserController extends GetxController {
  static ConsultantUserController get instance => Get.find();

  final userRepository = Get.put(ConsultantRepository());
  final profileLoading = false.obs;
  final profileRefresh = false.obs;
  final imageUploading = false.obs;
  final bool _isImagePickerActive = false;
  Rx<ConsultantUserDataModel> user = ConsultantUserDataModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord(isRefreshRequest: false);
  }
  //   @override
//   void onInit() {
//     super.onInit();
//     fetchUserRecord();
//   }

  Future<void> fetchUserRecord({required bool isRefreshRequest}) async {
    // fetch user record

    try {
      if (isRefreshRequest) {
        profileRefresh.value = true;
      } else {
        profileLoading.value = true;
      }
      final user =
          await userRepository.fetchUserDetails(forceRefresh: isRefreshRequest);
      this.user(user);
    } catch (e) {
      user(ConsultantUserDataModel.empty());
    } finally {
      if (isRefreshRequest) {
        profileRefresh.value = true;
      } else {
        profileLoading.value = true;
      }
    }
  }

  Future<void> saveUserRecordToLocal() async {
    // save user record to local
    // Object of Rx<ConsultantUserDataModel> user will be saved
    try {
      await userRepository.saveUserDetailsToLocal(user.value);
    } catch (e) {
      print(e.toString());
    }
//   Future<void> fetchUserRecord() async {
//     // fetch user record
//     try {
//       profileLoading.value = true;
//       final user = await userRepository.fetchUserDetails();
//       this.user(user);
//     } catch (e) {
//       user(UserModel.empty());
//     } finally {
//       profileLoading.value = false;
//     }
//   }

    // Future<void> saveUserRecord() async {
    //   // save user record
    //   try {
    //     await fetchUserRecord();
    //     // if no rec exists
    //     if (user.value.id.isEmpty) {
    //       if (userCredentials != null) {
    //         final nameParts =
    //             UserModel.nameParts(userCredentials.user!.displayName ?? '');

    //         final user = UserModel(
    //           id: userCredentials.user!.uid,
    //           email: userCredentials.user!.email ?? '',
    //           username: nameParts[0],
    //           fullName: userCredentials.user!.displayName ?? '',
    //           bgImg: '',
    //           bio: '',
    //           likes: 0,
    //           gender: '',
    //           phoneNo: '',
    //           dob: '',
    //           profileUrl: userCredentials.user!.photoURL ?? '',
    //         );

    //         // save user record
    //         await userRepository.saveUserRecord(user);
    //       }
    //     }
    //   } catch (e) {
    //     SLoader.warningSnackBar(
    //         title: 'Data not Saved', message: 'something went wrong!');
    //   }
    // }
    //   Future<void> saveUserRecord(UserCredential? userCredentials) async {
//     // save user record
//     try {
//       await fetchUserRecord();
//       // if no rec exists
//       if (user.value.id.isEmpty) {
//         if (userCredentials != null) {
//           final nameParts =
//               UserModel.nameParts(userCredentials.user!.displayName ?? '');

//           final user = UserModel(
//             id: userCredentials.user!.uid,
//             email: userCredentials.user!.email ?? '',
//             username: nameParts[0],
//             fullName: userCredentials.user!.displayName ?? '',
//             bgImg: '',
//             bio: '',
//             likes: 0,
//             gender: '',
//             phoneNo: '',
//             dob: '',
//             profileUrl: userCredentials.user!.photoURL ?? '',
//           );

//           // save user record
//           await userRepository.saveUserRecord(user);
//         }
//       }
//     } catch (e) {
//       SLoader.warningSnackBar(
//           title: 'Data not Saved', message: 'something went wrong!');
//     }
//   }

    // final for this app
    //   uploadProfilePicture() async {
    //     if (_isImagePickerActive) return;

    //     _isImagePickerActive = true;
    //     try {
    //       final image = await ImagePicker().pickImage(
    //           source: ImageSource.gallery,
    //           imageQuality: 80,
    //           maxWidth: 512,
    //           maxHeight: 512);
    //       if (image != null) {
    //         imageUploading.value = true;
    //         final imageUrl =
    //             await userRepository.uploadImage("Users/Images/Profile/", image);

    //         Map<String, dynamic> json = {'profileUrl': imageUrl};

    //         await userRepository.updateSingleUserField(json);

    //         user.update((val) {
    //           if (val != null) {
    //             val.profilePicture = imageUrl;
    //           }
    //         });
    //         SLoader.successSnackBar(
    //             title: 'Congratulations!',
    //             message: 'Your profile picture has been updated successfully');
    //       }
    //     } catch (e) {
    //       SLoader.warningSnackBar(
    //           title: 'Data not Saved', message: 'something went wrong : $e');
    //     } finally {
    //       imageUploading.value = false;
    //       _isImagePickerActive = false;
    //     }
    //   }
    // }
  }
}
