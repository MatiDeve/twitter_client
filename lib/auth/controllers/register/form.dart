import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/auth/models/register/form.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';

class RegisterFormController implements FormController {
  final RegisterFormModel _registerFormModel;
  RegisterFormController( this._registerFormModel );

  Register get data => _registerFormModel.data;

  List<FormFieldData> getFormFields() => _registerFormModel.getFormFields();
}