import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_controller.dart';
import 'contants.dart';

class MyCall extends StatelessWidget {
  const MyCall({Key? key, required this.callID}) : super(key: key);
  final String callID;
  // final UserController userController;


  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    const MyCall(callID: "your_call_id");

    return ZegoUIKitPrebuiltCall(
      appID: MyConst
          .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: MyConst
          .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userController.user.value.fullName,
      userName: userController.user.value.fullName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
