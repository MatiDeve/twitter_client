import 'dart:convert';

import 'package:twitter_client/shared/configs.dart';

import 'classes/user.dart';
import 'update_user.dart';
import 'package:http/http.dart' as http;

class ApiUpdateUserModel implements UpdateUserModel {
  @override
  Future<Null> update(User user) {

    Map<String, dynamic> data = {
      "realName": user.realName
    };

    print("open update realname");
    var url = Configs.API_URL + "users/"+user.nickName+"/updateRealName";
    http.put(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(data));
    print("close update realname");
  }
}