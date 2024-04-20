import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:someone_datingapp/app.dart';
import 'package:someone_datingapp/data/repositories/authentication_repo/authentication_repository.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // widget binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // local storage
  await GetStorage.init();

  // await splash until items loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  // Initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
