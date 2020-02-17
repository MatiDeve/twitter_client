import 'package:test/test.dart';
import 'package:twitter_client/tweets/controllers/post_tweet.dart';
import 'package:twitter_client/tweets/controllers/user_tweets.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';
import 'package:twitter_client/tweets/models/post_tweet/classes/content.dart';
import 'package:twitter_client/tweets/models/api_post_tweet.dart';
import 'package:twitter_client/tweets/models/api_user_tweets.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';
import 'package:twitter_client/users/controllers/local_user.dart';

void main() {
  LocalUserController _buildLocalUserService() {
    String userNickName = "MatiDeve";
    PostTweetModel postTweetModel = ApiPostTweetModel();
    PostTweetController postTweetService = PostTweetController(postTweetModel);
    UserTweetsModel userTweetsModel = ApiUserTweetsModel();
    UserTweetsController userTweetsService = UserTweetsController(userTweetsModel);
    return LocalUserController(userNickName, postTweetService, userTweetsService);
  }

  group("local user controller should", () {
    test("post and notify getUserTweets", () async {

      LocalUserController localUserService = _buildLocalUserService();
      Content contentData = Content("Hello world!");

      Future.delayed(const Duration(milliseconds: 500), () {
        localUserService.postTweet(contentData);
      });

      var events = await localUserService.userTweetsStream.take(3).toList();

      expect(events[0].length, 0);
      expect(events[2].length, events[1].length + 1);
    });
  });
}

