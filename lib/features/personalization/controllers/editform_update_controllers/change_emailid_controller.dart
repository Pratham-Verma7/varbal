import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class UpdateEmailidController extends GetxController {
  static UpdateEmailidController get instance => Get.find();

  final email = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateProfileEmailidFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeEmail();
    super.onInit();
  }

  Future<void> initializeEmail() async {
    email.text = userController.user.value.email;
  }

  Future<void> updateProfileEmail() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'We are updating your information...', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      if (!updateProfileEmailidFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> emailData = {
        'email': email.text.trim(),
      };

      await userRepository.updateSingleUserField(emailData);

      userController.user.update((val) {
        if (val != null) {
          val.email = email.text.trim();
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
