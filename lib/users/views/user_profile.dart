import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/auth/providers/auth.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/tweets/views/add_tweet_button.dart';
import 'package:twitter_client/tweets/views/user_tweets.dart';
import 'package:twitter_client/users/controllers/local_user.dart';
import 'package:twitter_client/users/views/user_generic.dart';
import 'package:twitter_client/users/views/user_search_button.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

class UserProfileScreen extends StatefulWidget {

  final String userNickName;

  const UserProfileScreen(this.userNickName, {Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  LocalUserController _localUserController;

  @override
  void initState() {
    _localUserController = ControllersDependencies.localUserControllerProvider(widget.userNickName);
    super.initState();
  }

  @override
  void dispose() {
    _localUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return UserGenericScreen(
      profileUserNickName: widget.userNickName,
      localUserNickName: widget.userNickName,
      child: StreamBuilder(
        stream: _localUserController.userTweetsStream,
        builder: (context, snapshot) => snapshot.hasData
            ? UserTweetsScreen(tweets: snapshot.data)
            : Loading()
      ),
      isVisitingYourself: true,
      appBarActions: [
        IconButton(
          onPressed: authProvider.logout,
          icon: Icon(Icons.exit_to_app),
        ),
      ],
      floatingActions: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UserSearchButton(widget.userNickName),
          SizedBox(height: 8,),
          AddTweetButton(postTweet: _localUserController.postTweet,),
        ],
      ),
    );
  }
}




