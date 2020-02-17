import 'package:rxdart/rxdart.dart';
import 'package:twitter_client/tweets/controllers/post_tweet.dart';
import 'package:twitter_client/tweets/controllers/user_tweets.dart';
import 'package:twitter_client/tweets/models/classes/tweet_post.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';
import 'package:twitter_client/tweets/models/post_tweet/classes/content.dart';

class LocalUserController {
  final String _userNickName;
  final PostTweetController _postTweetService;
  final UserTweetsController _userTweetsService;

  LocalUserController(this._userNickName, this._postTweetService, this._userTweetsService){
    _getUserTweets();
  }

  final BehaviorSubject<List<Tweet>> _userTweetsSubject = BehaviorSubject<List<Tweet>>.seeded([]);
  Stream<List<Tweet>> get userTweetsStream => _userTweetsSubject.stream;

  void postTweet(Content contentData) async {
    TweetPost tweetPost = TweetPost(_userNickName, contentData.content);
    await _postTweetService.postTweet(tweetPost);
    _getUserTweets();
  }

  void _getUserTweets () async =>
      _userTweetsSubject.add(await _userTweetsService.getUserTweets(_userNickName));


  void dispose() {
    _userTweetsSubject.close();
  }
}