import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/post_tweet/classes/content.dart';
import 'package:twitter_client/tweets/models/post_tweet/form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

void main() {
  group("post tweet model should", () {
    PostTweetFormModel postTweetFormModel;

    setUp(() {
      postTweetFormModel = PostTweetFormModel();
    });

    test("return list with content", (){
      List<FormFieldData> formFields = postTweetFormModel.getFormFields();
      expect(formFields[0].getLabelText, "Content");
    });

    test("return data with content", () {
      String content = "Hello Twitter!";
      postTweetFormModel.getFormFields()[0].getController.text = content;
      Content contentData = postTweetFormModel.data;
      expect(contentData.content, Content(content).content);
    });
  });
}



