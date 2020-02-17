import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/auth/models/register/form.dart';
import 'package:twitter_client/auth/controllers/register/form.dart';

class MockRegisterFormModel extends Mock implements RegisterFormModel{}

void main() {
  group("Register form should", () {

    RegisterFormModel registerFormModel;
    RegisterFormController registerFormController;

    setUp(() {
      registerFormModel = MockRegisterFormModel();
      registerFormController = RegisterFormController(registerFormModel);
    });

    test("get data", () {
      registerFormController.data;
      verify(registerFormModel.data);
    });

    test("get form fields", () {
      registerFormController.getFormFields();
      verify(registerFormModel.getFormFields());
    });
  });
}