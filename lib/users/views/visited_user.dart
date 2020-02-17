import 'package:flutter/material.dart';
import 'package:twitter_client/tweets/views/user_tweets_future.dart';

import 'user_generic.dart';

class VisitedUserScreen extends StatelessWidget {

  static const String routeName = "/users/visit";

  @override
  Widget build(BuildContext context) {

    final VisitedUserScreenArgs arguments = ModalRoute.of(context).settings.arguments;

    return UserGenericScreen(
      profileUserNickName: arguments.profileUserNickName,
      localUserNickName: arguments.localUserNickName,
      child: UserTweetsFuture(arguments.profileUserNickName),
    );
  }
}

class VisitedUserScreenArgs {
  final String profileUserNickName;
  final String localUserNickName;

  VisitedUserScreenArgs({ @required this.profileUserNickName, @required this.localUserNickName});
}