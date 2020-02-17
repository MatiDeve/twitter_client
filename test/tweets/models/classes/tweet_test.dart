import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';

void main() {
  group("Tweet should", () {
    test("contain nickname, content and timestamp", () {
      String nickName = "MatiDeve";
      String content = "Hello!";
      int timestamp = DateTime.now().millisecondsSinceEpoch;

      Tweet tweetData = Tweet(nickName, content, timestamp);

      expect(tweetData.nickName, nickName);
      expect(tweetData.content, content);
      expect(tweetData.timestampDate, timestamp);
    });

    test("convert timestamp to date", () {
      String nickName = "MatiDeve";
      String content = "Hello!";
      DateTime date = DateTime(2019, 11, 20);
      int timestamp = date.millisecondsSinceEpoch;

      Tweet tweetData = Tweet(nickName, content, timestamp);

      expect(tweetData.date, date);
    });

    test("return time ago", () {
      String nickName = "MatiDeve";
      String content = "Hello!";
      DateTime date = DateTime(2019, 11, 20);
      int timestamp = date.millisecondsSinceEpoch;

      Tweet tweetData = Tweet(nickName, content, timestamp);

      expect(tweetData.timeAgo, DateTime.now().difference(date).inDays.toString() + "d");
    });
  });
}