import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:twitter_client/users/controllers/update_user.dart';
import 'package:twitter_client/users/models/update_user.dart';

class MockUpdateUserModel extends Mock implements UpdateUserModel{}

void main() {
  group("update user controller should", () {
    test("connect with update user model's update", () {
      UpdateUserModel updateUserModel = MockUpdateUserModel();
      UpdateUserController updateUserController = UpdateUserController(updateUserModel);

      updateUserController.update("MatiDeve", "Matias Devecchi");
      verify(updateUserModel.update(any)).called(1);
    });
  });
}