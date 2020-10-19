import 'dart:ffi';

import 'package:dio/dio.dart';

class SingleUserInfo {
  String _baseUrl = "https://api.github.com/users/";

  Dio dio;
  BaseOptions options;

  //Requisição http com exceptions tratadas
  getUser(String user, String type) async {
    String selectedUser = "";
    switch (type) {
      case "userinfo":
        selectedUser = user;
        break;
      case "reposinfo":
        selectedUser = user + "/repos";
        break;
      case "orgsinfo":
        selectedUser = user + "/orgs";
        break;
    }
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      receiveDataWhenStatusError: true,
    );

    print("$_baseUrl" + "$selectedUser");
    try {
      Response response = await Dio(options).get(
        "$_baseUrl" + "$selectedUser",
      );
      print(response.data);
      return response.data;
    } on DioError catch (err) {
      if (err.type == DioErrorType.RECEIVE_TIMEOUT) {
        return "connectionerror";
      }
      if (err.type == DioErrorType.CONNECT_TIMEOUT) {
        return "connectionerror";
      }
      if (err.type == DioErrorType.SEND_TIMEOUT) {
        return "connectionerror";
      }
      if (err.type == DioErrorType.DEFAULT) {
        return "connectionerror";
      }
      return "othererror";
    }
    return "othererror";
  }
}
