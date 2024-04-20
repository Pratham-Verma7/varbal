import 'package:flutter/material.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class userProfileCardBottomButtons extends StatelessWidget {
  const userProfileCardBottomButtons({
    super.key,
    required this.button1Text,
    required this.button1OnPressed,
    required this.button2Text,
    required this.button2OnPressed,
  });

  final String button1Text, button2Text;
  final VoidCallback button1OnPressed, button2OnPressed;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  dark ? SColors.white.withOpacity(0.15) : SColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
              ),
            ),
            onPressed: button1OnPressed,
            child: Text(
              button1Text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )),
          const SizedBox(
            width: Sizes.spaceBtwItems,
          ),
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:
                  dark ? SColors.white.withOpacity(0.15) : SColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
              ),
            ),
            onPressed: button2OnPressed,
            child: Text(
              button2Text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )),
        ],
      ),
    );
  }
}
