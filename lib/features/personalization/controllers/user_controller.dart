import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/model/user_model.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  bool _isImagePickerActive = false;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    // fetch user record
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    // save user record
    try {
      await fetchUserRecord();
      // if no rec exists
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');

          final user = UserModel(
            id: userCredentials.user!.uid,
            email: userCredentials.user!.email ?? '',
            username: nameParts[0],
            fullName: userCredentials.user!.displayName ?? '',
            bgImg: '',
            bio: '',
            likes: 0,
            gender: '',
            phoneNo: '',
            dob: '',
            profileUrl: userCredentials.user!.photoURL ?? '',
          );

          // save user record
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SLoader.warningSnackBar(
          title: 'Data not Saved', message: 'something went wrong!');
    }
  }

  uploadProfilePicture() async {
    if (_isImagePickerActive) return;

    _isImagePickerActive = true;
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
          maxWidth: 512,
          maxHeight: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);

        Map<String, dynamic> json = {'profileUrl': imageUrl};

        await userRepository.updateSingleUserField(json);

        user.update((val) {
          if (val != null) {
            val.profileUrl = imageUrl;
          }
        });
        SLoader.successSnackBar(
            title: 'Congratulations!',
            message: 'Your profile picture has been updated successfully');
      }
    } catch (e) {
      SLoader.warningSnackBar(
          title: 'Data not Saved', message: 'something went wrong : $e');
    } finally {
      imageUploading.value = false;
      _isImagePickerActive = false;
    }
  }
}
