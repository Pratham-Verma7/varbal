import 'package:flutter/material.dart';
import 'package:someone_datingapp/features/auth/controllers.login/login_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SDeviceUtils.getAppBarHeight(),
      right: Sizes.defaultSpace,
      child: TextButton(
          onPressed: () => loginController.instance.skipPage(),
          child: const Text('Skip')),
    );
  }
}
