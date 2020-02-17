import 'package:flutter/material.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';
import 'package:twitter_client/tweets/views/tweet.dart';
import 'package:twitter_client/widgets/ui/DefaultMessage.dart';

class UserTweetsScreen extends StatelessWidget {
  final List<Tweet> tweets;

  const UserTweetsScreen({Key key, this.tweets}) : super(key: key);

  List<Widget> _buildTweets() =>
      tweets.map((tweet) => TweetView(tweet)).toList();

  Widget _buildNoTweets() =>
      DefaultMessage("There's not tweets yet.");

  Widget _buildTweetsView() =>
      tweets.length == 0 ? _buildNoTweets() : Column(children: _buildTweets(),);

  @override
  Widget build(BuildContext context) {
    return _buildTweetsView();
  }
}
