import 'dart:convert';

class Repository{
  String name;
  int stars;
  String url;
  String description;

  Repository({this.name, this.stars, this.url, this.description});


  toJson(Map<String,dynamic> json)
  {
    json["name"]!=null?name=json["name"].toString():name="Não informado.";
    json["stargazers_count"]!=null?stars=json["stargazers_count"]:stars=0;
    json["html_url"]!=null?url=json["html_url"].toString():url="Não informado.";
    json["description"]!=null?description=json["description"].toString():description="Não informado.";
  }
}
//Eu, como usuário, desejo ver a listagem dos repositórios desse usuário que foi buscado, ordenados pelo número decrescente de estrelas;