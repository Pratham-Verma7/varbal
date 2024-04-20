import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:someone_datingapp/bindings/general_bindings.dart';
import 'package:someone_datingapp/utils/constants/colors.dart';
import 'package:someone_datingapp/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // show leader meanwhile auth repo is deciding to show screen.
      home: const Scaffold(
        backgroundColor: SColors.primarybg,
        body: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
