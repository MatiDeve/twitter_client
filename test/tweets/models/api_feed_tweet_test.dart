import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';

void main() {
  test("Api feed tweet should", () {
    group("get all tweets from followings and user sort by date", () {

    });
  });
}

abstract class FeedTweetsModel {
  List<Tweet> getFeedTweets(String nickName);
}

class ApiFeedTweetsModel implements FeedTweetsModel{
  @override
  List<Tweet> getFeedTweets(String nickName) {
    // TODO: implement getFeedTweets
    return null;
  }
}