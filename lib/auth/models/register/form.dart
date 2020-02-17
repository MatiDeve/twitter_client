import 'package:twitter_client/widgets/helpers/forms/models/fields/nickname.dart';
import 'package:twitter_client/widgets/helpers/forms/models/fields/realname.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';


class RegisterFormModel implements FormModel {

  FormFieldData _nickNameField = NickNameField();
  FormFieldData _realNameField = RealNameField();

  @override
  List<FormFieldData> getFormFields() {
    return [_nickNameField, _realNameField];
  }

  @override
  FormData get data => Register(nickName: _nickNameField.getController.text, realName: _realNameField.getController.text);
}