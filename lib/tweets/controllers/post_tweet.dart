import 'package:twitter_client/tweets/models/classes/tweet_post.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';

class PostTweetController {
  final PostTweetModel _tweetModel;
  PostTweetController(this._tweetModel);

  Future<Null> postTweet(TweetPost tweetPost) async {
    await _tweetModel.postTweet(tweetPost);
  }
}