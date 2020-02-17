import 'dart:convert';

import 'package:twitter_client/shared/configs.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';
import 'package:http/http.dart' as http;
import 'classes/tweet.dart';

class ApiUserTweetsModel implements UserTweetsModel {
  @override
  Future<List<Tweet>> getUserTweets(String nickName) async {
    print("open user tweets");
    http.Response response = await http.get(Configs.API_URL + "tweets/"+nickName+"/tweets");
    print("close user tweets");
    Map<String, dynamic> responseData = json.decode(response.body);

    return _redisTweetsToTweets(responseData["tweets"]);
  }

  List<Tweet> _redisTweetsToTweets(List<dynamic> tweetsData) =>
      tweetsData.map((tweet) => Tweet(tweet["nickName"], tweet["content"], tweet["date"]))
          .toList();
}