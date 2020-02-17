import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/tweets/views/post_tweet/post_tweet.dart';
import 'package:twitter_client/users/providers/user.dart';

class AddTweetButton extends StatelessWidget {

  final Function postTweet;

  const AddTweetButton({Key key, this.postTweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);

    return userProvider.savedUserNickName == null
      ? Container()
      : FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Post tweet",
        heroTag: "Post",
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => PostTweet(userNickName: userProvider.savedUserNickName, postTweet: postTweet,),
          );
        },
      );
  }
}