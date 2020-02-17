import 'package:twitter_client/widgets/helpers/forms/models/fields/realname.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

import 'classes/user_edit.dart';

class UserEditFormModel implements FormModel {

  FormFieldData _realNameField = RealNameField();

  @override
  FormData get data => UserEdit(_realNameField.getController.text);

  @override
  List<FormFieldData> getFormFields() {
    return [_realNameField];
  }
}