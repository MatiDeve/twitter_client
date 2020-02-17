import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/auth/models/login/form.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';

class LoginFormController implements FormController{
  final LoginFormModel _loginFormModel;
  LoginFormController( this._loginFormModel );

  Login get data => _loginFormModel.data;

  List<FormFieldData> getFormFields() => _loginFormModel.getFormFields();
}