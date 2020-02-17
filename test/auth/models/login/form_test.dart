import 'package:test/test.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/auth/models/login/form.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

void main() {
  group("Form login should", () {

    FormModel _loginFormModel;

    setUp(() {
      _loginFormModel = LoginFormModel();
    });

    test("return list with nickname", () {
      List<FormFieldData> formFields = _loginFormModel.getFormFields();
      expect(1, formFields.length);
      expect("Nick Name", formFields[0].getLabelText);
    });

    test("have login connected with nickname", () {
      _loginFormModel.getFormFields()[0].getController.text = "Matias";
      Login loginData = _loginFormModel.data;
      expect("Matias", loginData.nickName);
    });
  });
}