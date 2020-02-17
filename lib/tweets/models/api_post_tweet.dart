import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twitter_client/shared/configs.dart';
import 'package:twitter_client/tweets/models/classes/tweet_post.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';

class ApiPostTweetModel implements PostTweetModel{
  @override
  postTweet(TweetPost tweetPost) async {

    Map<String, String> data = {
      "content": tweetPost.content,
    };

    print("open post tweet");

    await http.post(
        Configs.API_URL + "tweets/"+tweetPost.nickName+"/postTweet",
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(data));
    print("close post tweet");

  }
}