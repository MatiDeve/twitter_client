import 'package:test/test.dart';
import 'package:twitter_client/users/models/classes/user_edit.dart';
import 'package:twitter_client/users/models/user_edit_form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

void main() {
  group("edit user form model should", () {
    FormModel userEditFormModel;
    setUp(() {
      userEditFormModel = UserEditFormModel();
    });
    
    test("return list with realname", () {
      expect(userEditFormModel.getFormFields()[0].getLabelText, "Real Name");
    });

    test("return data with realname", () {
      var realName = "Matias Devecchi";
      userEditFormModel.getFormFields()[0].getController.text = realName;
      UserEdit user = userEditFormModel.data;
      expect(user.updatedRealName, realName);
    });
  });
}

