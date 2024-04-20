import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:someone_datingapp/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class loginController extends GetxController {
  // Add your logic here

  final userController = Get.put(UserController());

  static loginController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    // jump to specific dot selected
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void skipPage() {
    // skip to last page and move to home page
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Future<void> googleSignIn() async {
    // auth with google
    try {
      SFullScreenLoader.openLoadingDialog('Logging you in :)', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // google authentication
      final UserCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      //  save user data
      await userController.saveUserRecord(UserCredentials);

      SFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoader.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }

  void nextPage() {
    // move to next page
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      deviceStorage.write('IsFirstTime', false);
      // Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}
