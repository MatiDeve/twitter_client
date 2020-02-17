import 'package:flutter/material.dart';
import 'package:twitter_client/follows/models/classes/user.dart';
import 'user_follows.dart';

class UserFollowsContainerScreen extends StatelessWidget {

  static const routeName = "/follows";

  @override
  Widget build(BuildContext context) {

    UserFollowsContainerScreenArgs a = ModalRoute.of(context).settings.arguments;

    return UserFollowsScreen(
      profileUserNickName: a.profileUserNickName,
      localUserNickName: a.localUserNickName,
      typeText: a.typeText,
      userStream: a.userStream,
      refresh: a.refresh,
    );
  }
}

class UserFollowsContainerScreenArgs {
  final String profileUserNickName;
  final String localUserNickName;
  final String typeText;
  final Stream<List<User>> userStream;
  final Function refresh;

  UserFollowsContainerScreenArgs({@required this.profileUserNickName, @required this.localUserNickName, @required this.typeText, @required this.userStream, @required this.refresh});
}
