import 'package:test/test.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';

void main() {
  group("Login model should", () {
    test("have nickname", () {
      String nickName = "MatiDeve";
      Login loginData = Login(nickName: nickName);
      expect(nickName, loginData.nickName);
    });
  });
}