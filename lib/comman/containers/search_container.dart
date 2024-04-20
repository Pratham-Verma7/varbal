import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/device/device_utility.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class BSearchContainer extends StatelessWidget {
  const BSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
      child: Container(
        width: SDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(Sizes.m),
        decoration: BoxDecoration(
            color: showBackground
                ? (dark ? SColors.dark : SColors.light)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
            border: showBorder
                ? Border.all(
                    color: Colors.grey,
                  )
                : null),
        child: Row(
          children: [
            Icon(icon, color: SColors.darkerGrey),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
