import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/users/controllers/user_edit_form.dart';
import 'package:twitter_client/users/models/user_edit_form.dart';

class MockUserEditFormModel extends Mock implements UserEditFormModel{}

void main() {

  UserEditFormModel userEditFormModel;
  UserEditFormController userEditFormController;

  setUp(() {
    userEditFormModel = MockUserEditFormModel();
    userEditFormController = UserEditFormController(userEditFormModel);
  });

  group("User edit form controller should", () {
    test("connect with model's data", () {
      userEditFormController.data;
      verify(userEditFormModel.data).called(1);
    });
    test("connect with model's getFormFields", () {
      userEditFormController.getFormFields();
      verify(userEditFormModel.getFormFields()).called(1);
    });
  });
}