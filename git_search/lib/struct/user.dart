import 'package:flutter/material.dart';
import 'package:git_search/struct/repositories.dart';
import 'dart:convert';
import 'dart:core';

class User {
  String login; //: "luizh455",
  String avatarUrl; //: "https://avatars0.githubusercontent.com/u/9135372?v=4", avatar_url
  String name;
//organização, localização, número de seguidores, repositórios e stars); FALTA O NUMERO DE STARS
  String location; //": null,
  String followers; //": 2,
  String organizations;
  List<Repository> repos;
  int stars=0;

  toJson(Map<String, dynamic> json) {
    json["login"] != null
        ? login = json["login"].toString()
        : login = "Não informado.";
    json["avatar_url"] != null
        ? avatarUrl = json["avatar_url"].toString()
        : avatarUrl = "Não informado.";
    json["location"] != null
        ? location = json["location"].toString()
        : location = "Não informado.";
    json["followers"] != null
        ? followers = json["followers"].toString()
        : followers = "Não informado.";
    json["name"] != null
        ? name = json["name"].toString()
        : name = "Não informado.";
  }

  setOrgs(List<dynamic> listOrgs) {
    organizations = "";
    if (listOrgs.length == 0) {
      organizations = "Não Informado";
    } else {
      for (int i = 0; i < listOrgs.length; i++) {
        organizations += listOrgs[i]["login"];
        if (listOrgs.length - 1 != i) {
          organizations += ", ";
        }
      }
    }
  }

  setRepos(List<dynamic> listRepos) {
    repos = List<Repository>();

    if (listRepos.length == 0) {
      repos.add(Repository(
          name: "Nenhum repositório encontrado",
          stars: 0,
          url: "",
          description: ""));
    } else {
      for (int i = 0; i < listRepos.length; i++) {
        repos.add(Repository(
            name: listRepos[i]["name"],
            stars: listRepos[i]["stargazers_count"],
            url: listRepos[i]["html_url"],
            description: listRepos[i]["description"]!=null?listRepos[i]["description"]:"Sem Descrição"));
        stars+= listRepos[i]["stargazers_count"];
      }

      //name: listRepos[i]["name"]!=null?listRepos[i]["name"]:"Não informado.",forma de tratar null
    }
    print("REPOS");
    repos.length;
    for (int i = 0; i < repos.length; i++) {
      print(repos[i].name);
    }
    print("REPOS");
    //_sortRepos();
  }

  _sortRepos()
  {
    repos.sort((a,b) => a.stars.compareTo(b.stars));
  }
}
