import 'package:flutter/material.dart';

class SColors {
  SColors._();

  // App basic colors
  static const Color primary = Color(0xFFFF2A5C);
  static const Color secondary = Color(0xFFE91E63);
  static const Color accent = Color(0x49FF2A5C);
  // static const Color success = Color(0xFF4CAF50);

  //  Gradients Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color.fromARGB(255, 255, 123, 118),
      Color.fromARGB(255, 255, 255, 255),
    ],
  );

  // text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Color(0xFFFFFFFF);

  // background colors
  static const Color light = Color(0xFFE5E5E5);
  static const Color dark = Color(0xFF212121);
  static const Color primarybg = Color(0xFFFFFFFF);

  // background container colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static final Color darkContainer = SColors.white.withOpacity(0.1);

  // button colors
  static const Color buttonPrimary = Color(0xFF3F51B5);
  static const Color buttonSecondary = Color(0xFFE91E63);
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // border colors
  static const Color borderPrimary = Color(0xFFBDBDBD);
  static const Color borderSecondary = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF1976D2);

  // Neutral colors
  static const Color black = Color(0xFF000000);
  static const Color darkerGrey = Color(0xFF424242);
  static const Color darkGrey = Color(0xFF616161);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color softGrey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
}
