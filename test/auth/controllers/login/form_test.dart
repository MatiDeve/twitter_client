import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/auth/models/login/form.dart';
import 'package:twitter_client/auth/controllers/login/form.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';

class MockLoginFormModel extends Mock implements LoginFormModel{}

void main() {
  group("Login form should", () {

    LoginFormModel loginFormModel;
    FormController loginFormController;

    setUp(() {
      loginFormModel = MockLoginFormModel();
      loginFormController = LoginFormController(loginFormModel);
    });

    test("connect with model's data", () {
      loginFormController.data;
      verify(loginFormModel.data);
    });

    test("connect with model's fields", () {
      loginFormController.getFormFields();
      verify(loginFormModel.getFormFields());
    });
  });
}