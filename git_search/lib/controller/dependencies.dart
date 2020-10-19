import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:git_search/controller/user_controller.dart';
import 'package:get/get.dart';

class Dependencies implements Bindings {
  @override
  void dependencies() {//Instancia principal do UserController
    Get.put(UserController());
  }
}