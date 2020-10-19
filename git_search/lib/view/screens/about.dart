import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  String who = "Este App foi desenvolvido por Luiz Henrique Lage da Silva";
  String email = "Email de Contato: luizhenrique455@gmail.com";
  String github = "GitHub: luizh455";
  String why = "O aplicativo tem como objetivo aprofundar estudos de injeção de dependências, gestão de estados, requisição de web services e programação dart/flutter em geral. Duvidas, críticas ou sugestões? Entre em contato! ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o aplicativo:",),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Card(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                    child: Text(why, textAlign: TextAlign.justify,),),
                  Padding(padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                    child: Text(who, textAlign: TextAlign.justify,),),
                  Padding(padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                    child: Text(email, textAlign: TextAlign.justify,),),
                  Padding(padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                    child: Text(github, textAlign: TextAlign.justify,),),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
