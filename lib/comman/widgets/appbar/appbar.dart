import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/device/device_utility.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.appBarPadding = true,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool appBarPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appBarPadding
          ? const EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.s)
          : const EdgeInsets.symmetric(vertical: Sizes.s),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              )
            : leadingIcon != null
                ? (IconButton(
                    icon: Icon(leadingIcon),
                    onPressed: leadingOnPressed,
                  ))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // dont touch this
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}
