import 'package:test/test.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';

void main() {
  group("Register model should", () {
    test("have nickname and realname", () {
      String nickName = "MatiDeve";
      String realName = "Matias Devecchi";
      Register registerData = Register(nickName: nickName, realName: realName);
      expect(nickName, registerData.nickName);
      expect(realName, registerData.realName);
    });
  });
}