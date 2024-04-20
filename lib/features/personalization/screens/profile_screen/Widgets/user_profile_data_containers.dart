import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/features/personalization/controllers/user_profile_screen/user_profile_controller.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class UserProfileDataContainer extends StatelessWidget {
  const UserProfileDataContainer({
    super.key,
    required this.profileName,
    required this.profileUsername,
    required this.profileBio,
  });

  final String profileName;
  final String profileUsername;
  final String profileBio;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final UserProfileController controller = Get.put(UserProfileController());

    return Obx(() {
      String displayBio = controller.showFullBio.value
          ? profileBio
          : profileBio.substring(0, min(90, profileBio.length));

      return Container(
        width: SHelperFunctions.screenWidth() * 0.75,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            Text(
              profileName,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 4,
            ),
            Text(
              '@$profileUsername',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: dark
                      ? SColors.white.withOpacity(0.75)
                      : SColors.black.withOpacity(0.75)),
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.labelMedium,
                children: <InlineSpan>[
                  TextSpan(text: displayBio),
                  if (!controller.showFullBio.value && profileBio.length > 90)
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          controller.toggleBio();
                        },
                        child: const Text(
                          '..More',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
