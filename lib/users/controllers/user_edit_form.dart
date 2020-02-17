import 'package:twitter_client/users/models/user_edit_form.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class UserEditFormController implements FormController{

  final UserEditFormModel _userEditFormModel;
  UserEditFormController(this._userEditFormModel);

  @override
  FormData get data => _userEditFormModel.data;

  @override
  List<FormFieldData> getFormFields() {
    return _userEditFormModel.getFormFields();
  }
}