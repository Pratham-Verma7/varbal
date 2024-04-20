import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:someone_datingapp/data/repositories/user_repository/user_repository.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'package:someone_datingapp/utils/constants/lottie_Str.dart';
import 'package:someone_datingapp/utils/loaders/loaders.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';
import 'package:someone_datingapp/utils/popups/full_screen_loader.dart';

class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  final userName = TextEditingController();
  final _usernameSubject = PublishSubject<String>();
  bool _usernameIsValid = false;

  String? _usernameErrorMessage;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  // username check

  GlobalKey<FormState> updateProfileUsernameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeUserName();
    super.onInit();
  }

  Future<void> initializeUserName() async {
    userName.text = userController.user.value.username;
  }

  Future<void> updateProfileUsername() async {
    try {
      SFullScreenLoader.openLoadingDialog(
          'We are updating your information...', Slottie.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      if (!updateProfileUsernameFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> profileUserName = {
        'username': userName.text.trim(),
      };

      await userRepository.updateSingleUserField(profileUserName);

      userController.user.update((val) {
        if (val != null) {
          val.username = userName.text.trim();
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

  void onUsernameChanged(String username) {
    _usernameSubject.add(username);
  }

  UpdateUsernameController() {
    _usernameSubject.stream
        .debounceTime(const Duration(milliseconds: 800))
        .listen((username) async {
      _usernameErrorMessage = await UniqueUsername(username);
      _usernameIsValid = _usernameErrorMessage == null;
      updateProfileUsernameFormKey.currentState?.validate();
    });
  }

  Future<String?> UniqueUsername(String? value) async {
    final usernameRegExp = RegExp(r'^[a-z0-9_.]{3,20}$');
    final invalidSymbolsRegExp = RegExp(r'[^a-z0-9_.]');
    final capitalLetterRegExp = RegExp(r'[A-Z]');
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (capitalLetterRegExp.hasMatch(value)) {
      return 'Username should not contain capital letters';
    }
    if (invalidSymbolsRegExp.hasMatch(value)) {
      return 'only UnderScore, Dot and Numbers are allowed';
    }
    if (!usernameRegExp.hasMatch(value)) {
      return 'Username should be between 3 to 20 characters';
    }
    if (!await userRepository.userNameCheck(value)) {
      return 'Username is already taken';
    }
    return null;
  }

  String? usernameValidator(String? value) {
    return _usernameErrorMessage;
  }
}
