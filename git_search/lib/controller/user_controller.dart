import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:git_search/model/single_user_info.dart';
import 'package:git_search/struct/user.dart';
import 'package:git_search/view/dialogs/dialogs.dart';

//principal controller do app, armazena todas as informações do usuário
class UserController extends GetxController {
  //User userObs;
  SingleUserInfo getUserInfo = SingleUserInfo();
  var obsTest = User().obs;

  searchUser(String user, BuildContext context) async {
    var userResponse;
    var reposResponse;
    var orgsResponse;
    obsTest = User().obs;

    if (user == "" || user == null) {
      // Erro caso as inputs no campo sejam inválidas
      UserDialog.backError(context, text: "O campo usuário não pode ser vazio");
    } else {
      UserDialog.loadingPopUp(context);
      userResponse = await getUserInfo.getUser(user, "userinfo");
      if (userResponse == null ||
          userResponse.toString().contains("connectionerror") ||
          userResponse.toString().contains("othererror")) {
        // Erro caso ocorra alguma exception de conexão
        Get.back();
        UserDialog.backError(context,
            text: "Verifique a sua conexão com a internet",
            onTap: () => Get.back());
      } else {
        // Caso a primeira requisição seja concluida com sucesso retornando um usuário
        reposResponse = await getUserInfo.getUser(user, "reposinfo");
        orgsResponse = await getUserInfo.getUser(user, "orgsinfo");
        obsTest.value.toJson(userResponse);
        obsTest.value.setOrgs(orgsResponse);
        obsTest.value.setRepos(reposResponse);
        List<dynamic> reposList = reposResponse;
        Get.back();
        Get.toNamed('/user');
      }
    }
  }
}
