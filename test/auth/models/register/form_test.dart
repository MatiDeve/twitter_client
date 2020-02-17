import 'package:test/test.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/auth/models/register/form.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';

void main() {
  group("Form register should", () {

    RegisterFormModel _registerModel;

    setUp(() {
      _registerModel = RegisterFormModel();
    });

    test("return list with nickname and realname", () {
      List<FormFieldData> formFields = _registerModel.getFormFields();
      expect(2, formFields.length);
      expect("Nick Name", formFields[0].getLabelText);
      expect("Real Name", formFields[1].getLabelText);
    });

    test("have register connected with nickname and realname", () {
      _registerModel.getFormFields()[0].getController.text = "Matias";
      _registerModel.getFormFields()[1].getController.text = "Matias Devecchi";
      Register registerData = _registerModel.data;
      expect("Matias", registerData.nickName);
      expect("Matias Devecchi", registerData.realName);
    });
  });
}