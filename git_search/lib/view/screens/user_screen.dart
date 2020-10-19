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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                child: GetX<UserController>(
                  builder: (_) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage("${_.obsTest.value.avatarUrl}"),
                            fit: BoxFit.fitWidth),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Informações do usuário:",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Card(
                        child: GetX<UserController>(
                          builder: (_) {
                            return ListTile(
                              title: Text(
                                "Usuário / Login",
                                style: TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                "${_.obsTest.value.name} / ${_.obsTest.value.login}",
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "${"Organizações"}",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: GetX<UserController>(
                            builder: (_) {
                              return Text(
                                "${_.obsTest.value.organizations}",
                                style: TextStyle(fontSize: 18),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "Localização",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: GetX<UserController>(
                            builder: (_) {
                              return Text("${_.obsTest.value.location}",
                                  style: TextStyle(fontSize: 18));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "Estrela nos repositórios",
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: GetX<UserController>(
                            builder: (_) {
                              return Text(
                                "${_.obsTest.value.stars}",
                                style: TextStyle(fontSize: 18),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Lista de repositórios:",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: GetX<UserController>(
                        builder: (_) {
                          return Column(
                              children: List.generate(
                                  _.obsTest.value.repos.length, (index) {
                            return RepoCard(
                                _.obsTest.value.repos[index].name,
                                _.obsTest.value.repos[index].description,
                                _.obsTest.value.repos[index].stars);
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
