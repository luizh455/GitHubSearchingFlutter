import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:git_search/model/single_user_info.dart';
import 'package:git_search/struct/user.dart';
import 'package:git_search/view/dialogs/dialogs.dart';

class UserController extends GetxController {
  User userObs;
  SingleUserInfo getUserInfo = SingleUserInfo();



  searchUser(String user, BuildContext context) async {
    var userResponse;
    var reposResponse;
    var orgsResponse;
    userObs = User();

    if (user == "" || user == null) { // Erro caso as inputs no campo sejam inválidas
      UserDialog.backError(context, text: "O campo usuário não pode ser vazio");
    } else {
      userResponse = await getUserInfo.getUser(user, "userinfo");
      if (userResponse == null ||
          userResponse.toString().contains("connectionerror") ||
          userResponse.toString().contains("othererror")) { // Erro caso ocorra alguma exception de conexão
        UserDialog.backError(context,
            text: "Verifique a sua coneção com a internet",
            onTap: () => Get.back());
      } else { // Caso a primeira requisição seja concluida com sucesso retornando um usuário
       // print(userResponse);
        reposResponse = await getUserInfo.getUser(user, "reposinfo");

        //print(reposResponse);
        orgsResponse = await getUserInfo.getUser(user, "orgsinfo");
        print(orgsResponse);
        userObs.toJson(userResponse);
        userObs.setOrgs(orgsResponse);
        userObs.setRepos(reposResponse);
        List<dynamic> reposList =  reposResponse;
        print ("list number");
        print(reposList.length);
        Get.put(userObs);
        Get.toNamed('/user');
      }
    }
  }
}
