import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/controller/user_controller.dart';
import 'package:git_search/view/dialogs/dialogs.dart';
import 'package:git_search/view/widgets/rounded_button.dart';

class MainMenu extends StatelessWidget {
  final userInput = new TextEditingController(text: "");
  final UserController userController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: Text(
                      "Buscador ",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      "de usuários",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      "GitHub",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                child: TextFormField(
                  controller: userInput,
                  decoration: InputDecoration(
                    hintText: "Insira o nome de usuário",
                    border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: RoundedButton(
                  text: "Buscar usuário",
                  function: () => {
                    userController.searchUser(userInput.text, context)
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: RoundedButton(
                  text: "Sobre",
                  function: () => UserDialog.backError(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
