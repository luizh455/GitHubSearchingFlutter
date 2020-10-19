import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Classe para a declaração de Dialogs ModdalBottomSheet
class UserDialog {
  //Tela de erro
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

  //tela de loading com animação
  static void loadingPopUp(BuildContext context,
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
                    CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
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
