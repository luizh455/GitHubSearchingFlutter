import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/screens/main_menu.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/menu',
    defaultTransition: Transition.native,
    getPages: [
      GetPage(name: 'menu', page: () => MainMenu())
    ],
  ));
}
