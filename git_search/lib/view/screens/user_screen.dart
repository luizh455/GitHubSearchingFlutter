import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/controller/user_controller.dart';
import 'package:git_search/struct/user.dart';
import 'dart:async';

import 'package:git_search/view/widgets/repo_card.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final User user = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(
                          image: NetworkImage("${user.avatarUrl}"),
                          fit: BoxFit.fill

                        )
                      ),
                    ),

                  ),
                  Card(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 8),
                          child:  Text("Informações do usuário:",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600
                            ),),),

                        Padding(
                          padding: EdgeInsets.only(top:8),
                          child: Card(
                            child: ListTile(
                              title: Text("Usuário / Login", style: TextStyle(fontSize: 18),),
                              subtitle: Text("${user.name} / ${user.login}",style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top:8),
                          child: Card(
                            child: ListTile(
                              title: Text("${"Organizações"}", style: TextStyle(fontSize: 18),),
                              subtitle: Text("${user.organizations}", style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:8),
                          child: Card(
                            child: ListTile(
                              title: Text("Localização", style: TextStyle(fontSize: 18),),
                              subtitle: Text("${user.location}",style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top:8),
                          child: Card(
                            child: ListTile(
                              title: Text("Estrela nos repositórios",style: TextStyle(fontSize: 18),),
                              subtitle: Text("${user.stars}", style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                       Padding(padding: EdgeInsets.only(top: 8),
                       child:  Text("Lista de repositórios:",
                         style: TextStyle(
                             fontSize: 28,
                             fontWeight: FontWeight.w600
                         ),),),

                        Column(children:
                          List.generate(user.repos.length, (index) {
                            return RepoCard(user.repos[index].name, user.repos[index].description, user.repos[index].stars);
                          }),
                        )




                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
