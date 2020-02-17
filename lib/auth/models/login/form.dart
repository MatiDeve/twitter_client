import 'package:twitter_client/widgets/helpers/forms/models/fields/nickname.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';


class LoginFormModel implements FormModel {

  FormFieldData _nickNameField = NickNameField();

  @override
  List<FormFieldData> getFormFields() {
    return [_nickNameField];
  }

  @override
  FormData get data => Login(nickName: _nickNameField.getController.text);
}