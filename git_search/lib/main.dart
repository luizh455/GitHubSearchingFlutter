import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/controller/user_controller.dart';
import 'package:git_search/view/screens/main_menu.dart';
import 'package:git_search/view/screens/user_screen.dart';

void main() {
  //UserController userController = Get.put(UserController());
  initServices();
  runApp(GetMaterialApp(
    initialRoute: '/menu',
    defaultTransition: Transition.native,
    getPages: [
      GetPage(name: '/menu', page: () => MainMenu()),
      GetPage(name: '/user', page: () => UserScreen()),
    ],
  ));
}

initServices() async {
  Get.create(() => UserController());
  Get.put(() => UserController().onInit());
}
