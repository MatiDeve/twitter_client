import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/users/controllers/user_search_form.dart';
import 'package:twitter_client/users/models/user_search_form.dart';

class MockUserSearchFormModel extends Mock implements UserSearchFormModel{}

void main() {

  UserSearchFormModel userSearchFormModel;
  UserSearchFormController userSearchFormController;

  setUp(() {
    userSearchFormModel = MockUserSearchFormModel();
    userSearchFormController = UserSearchFormController(userSearchFormModel);
  });

  group("User edit form controller should", () {
    test("connect with model's data", () {
      userSearchFormController.data;
      verify(userSearchFormModel.data).called(1);
    });
    test("connect with model's getFormFields", () {
      userSearchFormController.getFormFields();
      verify(userSearchFormModel.getFormFields()).called(1);
    });
  });
}