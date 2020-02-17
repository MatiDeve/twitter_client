import 'package:test/test.dart';
import 'package:twitter_client/users/models/classes/user.dart';
import 'package:twitter_client/users/models/api_update_user.dart';
import 'package:twitter_client/users/models/update_user.dart';

void main() {
  group("Update user model should", () {
    test("upadte user realName", () {
      UpdateUserModel updateUserModel = ApiUpdateUserModel();
      User user = User("MatiDeve", "Matias Devecchi");
      updateUserModel.update(user); // TODO: COMO LO TESTEO?
    });
  });
}