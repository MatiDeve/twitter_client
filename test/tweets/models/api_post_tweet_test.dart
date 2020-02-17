import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/classes/tweet_post.dart';
import 'package:twitter_client/tweets/models/api_post_tweet.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';

void main() {
  group("users model should", () {

    PostTweetModel _tweetModel;

    setUp((){
      _tweetModel = ApiPostTweetModel();
    });

    test("post tweet", () async {
      await _tweetModel.postTweet(TweetPost("MatiDeve", "Hola mundo!")); // ver como testear TODO
    });
  });
}



