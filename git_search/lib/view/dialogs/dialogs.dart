import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDialog {
  static void backError(BuildContext context,
      {String text, Function onTap}) async {
    showModalBottomSheet(
        isScrollControlled: false,
        isDismissible: true,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: Get.back,
            child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 80,
                    ),
                     Text(
                      "$text",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                       textAlign: TextAlign.center,
                    )
                  ],
                )),
          );
        });
  }

  static void Loading(BuildContext context,
      {String text, Function onTap}) async {
    showModalBottomSheet(
        isScrollControlled: false,
        isDismissible: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: Get.back,
            child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(backgroundColor: Colors.black,),
                    Text(
                      "Buscando dados...",
                      style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          );
        });
  }
}
