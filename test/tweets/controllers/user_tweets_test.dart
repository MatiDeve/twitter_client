import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/tweets/controllers/user_tweets.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';

class MockUserTweetsModel extends Mock implements UserTweetsModel{}

void main() {
  group("User tweets controller should", () {
    test("connect with tweet model's getUserTweets", (){
      UserTweetsModel tweetModel = MockUserTweetsModel();
      UserTweetsController tweetService = UserTweetsController(tweetModel);

      String nickName = "MatiDeve";

      tweetService.getUserTweets(nickName);
      verify(tweetModel.getUserTweets(nickName));
    });
  });
}