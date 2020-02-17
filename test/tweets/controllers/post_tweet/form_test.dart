import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:twitter_client/tweets/controllers/post_tweet/form.dart';
import 'package:twitter_client/tweets/models/post_tweet/form.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';

class MockPostTweetFormModel extends Mock implements PostTweetFormModel{}

void main() {
  group("Post tweet form controller should", () {

    PostTweetFormModel postTweetFormModel;
    FormController postTweetFormController;

    setUp(() {
      postTweetFormModel = MockPostTweetFormModel();
      postTweetFormController = PostTweetFormController(postTweetFormModel);
    });

    test("connect with model's data", () {
      postTweetFormController.data;
      verify(postTweetFormModel.data).called(1);
    });

    test("connect with model's fields", () {
      postTweetFormController.getFormFields();
      verify(postTweetFormModel.getFormFields()).called(1);
    });
  });
}