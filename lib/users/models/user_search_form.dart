import 'package:twitter_client/widgets/helpers/forms/models/fields/nickname.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

import 'classes/user_search.dart';

class UserSearchFormModel implements FormModel {

  FormFieldData _nickNameField = NickNameField();

  @override
  List<FormFieldData> getFormFields() {
    return [_nickNameField];
  }

  @override
  FormData get data => UserSearch(_nickNameField.getController.text);
}