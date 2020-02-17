import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/post_tweet/fields/content.dart';

void main() {
  group("Content field should", () {
    ContentField contentField;

    setUp(() {
      contentField = ContentField();
    });

    test("return Content as labelText", () {
      expect(contentField.getLabelText, "Content");
    });

    test("return required if value is empty", () {
      expect(contentField.validate(""), "Content is required.");
    });

    test("return null if value is ok", () {
      expect(contentField.validate("Hello Twitter!"), null);
    });
  });
}