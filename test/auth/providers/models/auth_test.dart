import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_client/auth/providers/models/auth.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';

void main() {

  group("auth provider model should", () {

    AuthProviderModel authModel;

    setUp(() {
      SharedPreferences.setMockInitialValues(<String, dynamic>{"nickName": "MatiDeve"});
      authModel = AuthProviderModel();
    });

    test("login", () {
      expectLater(authModel.isAuthStream, emitsInOrder([false, true]));
      var loginData = Login(nickName: "MatiDeve");
      authModel.login(loginData);
    });

    test("register", () {
      expectLater(authModel.isAuthStream, emitsInOrder([false, true]));
      var registerData = Register(nickName: "MatiDeve", realName: "Matias Devecchi");
      authModel.register(registerData);
    });

    test("logout", () async {
      expectLater(authModel.isAuthStream, emitsInOrder([false, true, false]));
      var loginData = Login(nickName: "MatiDeve");
      authModel.login(loginData);
      authModel.logout();
    });
  });
}