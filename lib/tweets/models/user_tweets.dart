import 'classes/tweet.dart';

abstract class UserTweetsModel {
  Future<List<Tweet>> getUserTweets(String nickName);
}