import 'package:flutter/material.dart';
import 'package:twitter_client/tweets/models/classes/tweet.dart';
import 'package:twitter_client/widgets/ui/generic_card.dart';

class TweetView extends StatelessWidget {

  final Tweet tweet;

  const TweetView(this.tweet, {
    Key key,
  }) : super(key: key);

  TextSpan _nickName() {
    return TextSpan(
        text: tweet.nickName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        )
    );
  }

  TextSpan _timeAgo() {
    return TextSpan(
        text: tweet.timeAgo,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
        )
    );
  }

  Widget _nickNameAndTimeAgo() {
    return RichText(
        text: TextSpan(
          children: <TextSpan>[
            _nickName(),
            TextSpan(text: " "),
            _timeAgo(),
          ]
        ),
    );
  }

  Widget _content() {
    return Text(
        tweet.content,
        style: TextStyle(
          fontSize: 16.0,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenericCard(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _nickNameAndTimeAgo(),
            SizedBox(
              height: 8.0,
            ),
            _content(),
          ],
        ),
      ),
    );
  }
}