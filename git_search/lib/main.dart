import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/controller/dependencies.dart';
import 'package:git_search/controller/user_controller.dart';
import 'package:git_search/view/screens/about.dart';
import 'package:git_search/view/screens/main_menu.dart';
import 'package:git_search/view/screens/user_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/menu',
    defaultTransition: Transition.native,
    getPages: [
      GetPage(name: '/menu', page: () => MainMenu(), binding: Dependencies()),
      GetPage(name: '/user', page: () => UserScreen(), binding: Dependencies()),
      GetPage(name: '/about', page: () => About()),


    ],
  ));
}
