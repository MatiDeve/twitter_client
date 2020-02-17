import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/tweets/controllers/post_tweet.dart';
import 'package:twitter_client/tweets/models/classes/tweet_post.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';

class MockTweetModel extends Mock implements PostTweetModel{}

void main() {
  group("Post tweet controller should", () {
    test("connect with tweet model's postTweet", (){
      PostTweetModel tweetModel = MockTweetModel();
      PostTweetController postTweetService = PostTweetController(tweetModel);

      TweetPost tweetPost = TweetPost("MatiDeve", "Hello World!");

      postTweetService.postTweet(tweetPost);
      verify(tweetModel.postTweet(tweetPost));
    });
  });
}