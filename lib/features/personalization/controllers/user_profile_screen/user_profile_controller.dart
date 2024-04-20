import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var showFullBio = false.obs;

  void toggleBio() {
    showFullBio.value = !showFullBio.value;
  }
}
