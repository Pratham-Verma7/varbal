import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/comman/widgets/login_sign_btn/social_buttons.dart';
import 'package:someone_datingapp/features/auth/controllers.login/login_controller.dart';
import 'package:someone_datingapp/features/auth/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:someone_datingapp/features/auth/screens/onboarding/widgets/onboarding_page.dart';
import 'package:someone_datingapp/features/auth/screens/onboarding/widgets/onboarding_signinwith.dart';
import 'package:someone_datingapp/features/auth/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:someone_datingapp/utils/constants/images_str.dart';
import 'package:someone_datingapp/utils/constants/text_str.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    return Scaffold(
      body: Stack(
        children: [
          // Add your logic here
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: SImages.onBoardingImg1,
                title: STexts.onboardingTitle1,
                description: STexts.onboardingDesc1,
              ),
              onBoardingPage(
                image: SImages.onBoardingImg1,
                title: STexts.onboardingTitle2,
                description: STexts.onboardingDesc2,
              ),
              onBoardingPage(
                image: SImages.onBoardingImg1,
                title: STexts.onboardingTitle3,
                description: STexts.onboardingDesc3,
              ),
            ],
          ),

          const onBoardingSkip(),

          const onBoardingSn(),

          const obBoardingDotNavigation(),

          const SSocialButtons(),
        ],
      ),
    );
  }
}
