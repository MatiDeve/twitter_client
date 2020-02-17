import 'package:twitter_client/tweets/models/classes/tweet.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';

class UserTweetsController {
  final UserTweetsModel _userTweetsModel;
  UserTweetsController(this._userTweetsModel);

  Future<List<Tweet>> getUserTweets(String nickName) async =>
      await _userTweetsModel.getUserTweets(nickName);
}