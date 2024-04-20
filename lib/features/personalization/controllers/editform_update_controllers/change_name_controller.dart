import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final fullName = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateProfileNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    fullName.text = userController.user.value.fullName;
  }

  Future<void> updateProfileName() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'We are updating your information...', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      if (!updateProfileNameFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> profileName = {
        'fullName': fullName.text.trim(),
      };

      await userRepository.updateSingleUserField(profileName);

      userController.user.update((val) {
        if (val != null) {
          val.fullName = fullName.text.trim();
        }
      });

      SFullScreenLoader.stopLoading();

      SLoader.successSnackBar(
          title: 'Name Updated',
          message: 'Your name has been updated successfully');

      Get.close(1);
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoader.warningSnackBar(
          title: 'Data not Saved', message: 'something went wrong!');
    }
  }
}
