import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    // backgroundColor: Colors.white,
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
    // secondarySelectedColor: Colors.blue[100],
    // shadowColor: Colors.black,
    // selectedShadowColor: Colors.black,
    // showCheckmark: false,
    // labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(16),
    // ),
    // secondaryLabelStyle: const TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w500,
    //   color: Colors.black,
    // ),
    // brightness: Brightness.light,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    // backgroundColor: Colors.black,
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
    // secondarySelectedColor: Colors.blue[100],
    // shadowColor: Colors.black,
    // selectedShadowColor: Colors.black,
    // showCheckmark: false,
    // labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(16),
    // ),
    // secondaryLabelStyle: const TextStyle(
    //   fontSize: 14,
    //   fontWeight: FontWeight.w500,
    //   color: Colors.black,
    // ),
    // brightness: Brightness.light,
  );
}
