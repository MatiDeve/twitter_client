import 'package:flutter/material.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/tweets/controllers/user_tweets.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

import 'user_tweets.dart';

class UserTweetsFuture extends StatelessWidget {

  final String profileUserNickName;

  UserTweetsFuture(this.profileUserNickName, {Key key,}) : super(key: key);

  final UserTweetsController _userTweetsController = ControllersDependencies.userTweetsControllerProvider();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: _userTweetsController.getUserTweets(profileUserNickName),
        builder: (context, snapshot) => snapshot.hasData
            ? UserTweetsScreen(tweets: snapshot.data)
            : Loading()
    );
  }
}