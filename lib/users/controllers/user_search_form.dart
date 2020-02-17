import 'package:twitter_client/users/models/user_search_form.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class UserSearchFormController implements FormController{

  final UserSearchFormModel _userSearchFormModel;
  UserSearchFormController(this._userSearchFormModel);

  @override
  // TODO: implement data
  FormData get data => _userSearchFormModel.data;

  @override
  List<FormFieldData> getFormFields() {
    // TODO: implement getFormFields
    return _userSearchFormModel.getFormFields();
  }
}