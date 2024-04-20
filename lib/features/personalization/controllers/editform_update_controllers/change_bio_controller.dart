import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class UpdateBioController extends GetxController {
  static UpdateBioController get instance => Get.find();

  final bio = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateProfileBioFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeBio();
    super.onInit();
  }

  Future<void> initializeBio() async {
    bio.text = userController.user.value.bio;
  }

  Future<void> updateProfileBio() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'We are updating your information...', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      if (!updateProfileBioFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> bioData = {
        'bio': bio.text.trim(),
      };

      await userRepository.updateSingleUserField(bioData);

     userController.user.update((val) {
        if (val != null) {
          val.bio = bio.text.trim();
        }
      });
      SFullScreenLoader.stopLoading();

      SLoader.successSnackBar(
          title: 'Bio Updated',
          message: 'Your bio has been updated successfully!');

      Get.close(1);
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoader.warningSnackBar(
          title: 'Data not Saved', message: 'something went wrong!');
    }
  }
}
