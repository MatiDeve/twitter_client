import 'package:test/test.dart';
import 'package:twitter_client/tweets/models/classes/tweet_post.dart';

void main() {
  group("TweetPost should", () {
    test("contain nickname and content", () {
      String nickName = "MatiDeve";
      String content = "Hello!";

      TweetPost tweetData = TweetPost(nickName, content);

      expect(tweetData.nickName, nickName);
      expect(tweetData.content, content);
    });
  });
}