import 'package:test/test.dart';
import 'package:twitter_client/widgets/helpers/forms/models/fields/realname.dart';

void main() {
  group("Realname field should", () {
    RealNameField realNameField;

    setUp(() {
      realNameField = RealNameField();
    });

    test("return Real Name as labelText", () {
      expect(
          "Real Name",
          realNameField.getLabelText
      );
    });

    test("return required if value is empty", () {
      expect(
          realNameField.validate(""),
          "Realname is required."
      );
    });

    test("return null if value is ok", () {
      expect(
          realNameField.validate("hello_world"),
          null
      );
    });
  });
}