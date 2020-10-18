import 'package:flutter/material.dart';
import 'package:git_search/widgets/rounded_button.dart';

class MainMenu extends StatelessWidget {
  final controller = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 30),
                  child: Center(child: Text("Buscador ",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800
                    ),),)),
              Padding(padding: EdgeInsets.only(top: 5),
                  child: Center(child: Text("de usuários",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800
                    ),),)),
              Padding(padding: EdgeInsets.only(top: 5),
                  child: Center(child: Text("GitHub",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800
                    ),),)),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: RoundedButton(
                  text: "Buscar usuário",
                  function: () => print("teste"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30,),
                child: RoundedButton(
                  text: "Sobre",
                  function: () => print("teste"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
