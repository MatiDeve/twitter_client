import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';
import 'package:twitter_client/tweets/models/api_user_tweets.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';

void main() {
  group("users tweets model should", () {

    UserTweetsModel _tweetModel;

    setUp((){
      _tweetModel = ApiUserTweetsModel();
    });

    test("get user's tweets", () async {
      List<Tweet> userTweets = await _tweetModel.getUserTweets("MatiDeve");
      expect(userTweets.length > 0, true);
    });
  });
}



