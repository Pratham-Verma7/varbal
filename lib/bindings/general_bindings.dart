import 'package:get/get.dart';
import 'package:someone_datingapp/utils/network_manager/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
