import 'package:test/test.dart';
import 'package:twitter_client/widgets/helpers/forms/models/fields/nickname.dart';

void main() {
  group("Nickname field should", () {
    NickNameField nickNameField;

    setUp(() {
      nickNameField = NickNameField();
    });

    test("return Nick Name as labelText", () {
      expect(
        "Nick Name",
        nickNameField.getLabelText
      );
    });

    test("return required if value is empty", () {
      expect(
          nickNameField.validate(""),
          "Nickname is required."
      );
    });

    test("return min length if value's length is minus than six", () {
      expect(
          nickNameField.validate("hello"),
          "Min. length is six."
      );
    });

    test("return no space if value has spaces", () {
      expect(
          nickNameField.validate("hello world"),
          "Nickname musn't have spaces."
      );
    });

    test("return null if value is ok", () {
      expect(
          nickNameField.validate("hello_world"),
          null
      );
    });
  });
}