import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/follows/controllers/follows.dart';
import 'package:twitter_client/follows/models/classes/user.dart';
import 'package:twitter_client/follows/providers/follows.dart';
import 'package:twitter_client/follows/views/user_follows_container.dart';
import 'package:twitter_client/widgets/ui/generic_card.dart';

class FollowsBox extends StatelessWidget {

  final String _nickName;
  final String _typeText;
  final List<User> _follows;
  final FollowsController _followsController;

  const FollowsBox(this._nickName, this._typeText, this._follows, this._followsController, {Key key}) : super(key: key);

  final boldStyle = const TextStyle(fontWeight: FontWeight.w500);

  Widget _number() => Text(
    _follows.length.toString(),
    style: boldStyle.copyWith(fontSize: 20),
  );

  Widget _type() => Text(
    _typeText,
    style: boldStyle.copyWith(fontSize: 16),
  );

  @override
  Widget build(BuildContext context) {

    final FollowsProvider followsProvider = Provider.of<FollowsProvider>(context);

    return GestureDetector(
      onTap: () {
        UserFollowsContainerScreenArgs a = UserFollowsContainerScreenArgs(
            profileUserNickName: _nickName,
            localUserNickName: followsProvider.localUserNickName,
            typeText: _typeText,
            refresh: _followsController.refresh,
            userStream: _typeText == "Followings" ? _followsController.userFollowingsStream : _followsController.userFollowersStream
        );

        Navigator.of(context).pushNamed(UserFollowsContainerScreen.routeName, arguments: a);
      },
      child: GenericCard(
        child: Column(
          children: <Widget>[
            _number(),
            SizedBox(height: 8.0),
            _type(),
          ],
        ),
      )
    );
  }
}