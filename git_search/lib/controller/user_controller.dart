import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:git_search/model/single_user_info.dart';
import 'package:git_search/struct/user.dart';
import 'package:git_search/view/dialogs/dialogs.dart';

class UserController extends GetxController {
  //User userObs;
  SingleUserInfo getUserInfo = SingleUserInfo();
  var obsTest = User().obs;



  searchUser(String user, BuildContext context) async {

    var userResponse;
    var reposResponse;
    var orgsResponse;
    //userObs = User();
    obsTest= User().obs;

    if (user == "" || user == null) { // Erro caso as inputs no campo sejam inválidas
      UserDialog.backError(context, text: "O campo usuário não pode ser vazio");
    } else {
      UserDialog.Loading(context);
      userResponse = await getUserInfo.getUser(user, "userinfo");
      if (userResponse == null ||
          userResponse.toString().contains("connectionerror") ||
          userResponse.toString().contains("othererror")) { // Erro caso ocorra alguma exception de conexão
        Get.back();
        UserDialog.backError(context,
            text: "Verifique a sua conexão com a internet",
            onTap: () => Get.back());
      } else { // Caso a primeira requisição seja concluida com sucesso retornando um usuário
       // print(userResponse);
        reposResponse = await getUserInfo.getUser(user, "reposinfo");

        //print(reposResponse);
        orgsResponse = await getUserInfo.getUser(user, "orgsinfo");

        obsTest.value.toJson(userResponse);
        obsTest.value.setOrgs(orgsResponse);
        obsTest.value.setRepos(reposResponse);
        //
        // userObs.toJson(userResponse);
        // userObs.setOrgs(orgsResponse);
        // userObs.setRepos(reposResponse);
        List<dynamic> reposList =  reposResponse;
        //obsTest.value=userObs;
        Get.back();
        Get.toNamed('/user');
      }
    }
  }
}
