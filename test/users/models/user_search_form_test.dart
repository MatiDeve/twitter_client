import 'package:test/test.dart';
import 'package:twitter_client/users/models/classes/user_search.dart';
import 'package:twitter_client/users/models/user_search_form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

void main() {
  group("search user form model should", () {
    FormModel userSearchFormModel;
    setUp(() {
      userSearchFormModel = UserSearchFormModel();
    });

    test("return list with nickname", () {
      expect(userSearchFormModel.getFormFields()[0].getLabelText, "Nick Name");
    });

    test("return data with nickname", () {
      var nickName = "MatiDeve";
      userSearchFormModel.getFormFields()[0].getController.text = nickName;
      UserSearch user = userSearchFormModel.data;
      expect(user.nickName, nickName);
    });
  });
}
