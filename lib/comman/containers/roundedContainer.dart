import 'package:flutter/material.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/helpers/helper_functions.dart';

class roundedContainer extends StatelessWidget {
  const roundedContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: SHelperFunctions.isDarkMode(context)
              ? SColors.white.withOpacity(0.15)
              : SColors.lightGrey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: child);
  }
}
