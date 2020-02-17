import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_client/users/providers/models/user.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("provider users model should", () {
    test("get user saved", () async {
      SharedPreferences.setMockInitialValues(<String, dynamic>{"nickName": "MatiDeve"});
      UserModelProvider _userModelProvider = UserModelProvider();
      expectLater(_userModelProvider.savedNickNameStream, emitsInOrder([null, "MatiDeve"]));
    });
  });
}