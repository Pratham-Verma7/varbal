import 'package:flutter/material.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/constants/sizes.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class BSettingMenuTile extends StatelessWidget {
  const BSettingMenuTile(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      required this.subTitle,
      this.trailing});

  final IconData icon;
  final String title, subTitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return ListTile(
        leading: Icon(icon, size: 28, color: SColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle:
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
        onTap: onTap,
        trailing: trailing,
        tileColor: dark
            ? SColors.white.withOpacity(0.05)
            : SColors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
        ));
  }
}
