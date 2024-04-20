import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  final gender = TextEditingController();
  RxString selectedGender = ''.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateGenderFormKey = GlobalKey<FormState>();

  void setSelectedGender(String value) {
    selectedGender.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initializeGender();
  }

  Future<void> initializeGender() async {
    gender.text = userController.user.value.gender;
    if (gender.text == 'Male' || gender.text == 'Female') {
      selectedGender.value = gender.text;
    }
  }

  Future<void> updateGender() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'We are updating your information...', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      if (!updateGenderFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // Update tempSelectedGender before updating the user data
      gender.text = selectedGender.value;

      Map<String, dynamic> pushGender = {
        'gender': gender.text.trim(),
      };

      await userRepository.updateSingleUserField(pushGender);

      userController.user.update((val) {
        if (val != null) {
          val.gender = gender.text.trim();
        }
      });

      SFullScreenLoader.stopLoading();

      SLoader.successSnackBar(
          title: 'Gender Updated',
          message: 'Your gender has been updated successfully');

      Get.close(1);
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoader.warningSnackBar(
          title: 'Data not Saved', message: 'something went wrong!');
    }
  }
}
