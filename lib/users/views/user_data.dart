import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/follows/views/follows_container.dart';
import 'package:twitter_client/users/providers/profile_user.dart';

class UserDataScreen extends StatelessWidget {
  final String _nickName;

  const UserDataScreen(this._nickName, {Key key}) : super(key: key);

  Widget _nickNameText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _nickName,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final ProfileUserProvider profileUserProvider = Provider.of<ProfileUserProvider>(context);

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _nickNameText(context),
        FollowsContainerScreen(_nickName, profileUserProvider.localUserNickName),
        SizedBox(height: 12.0),
      ],
    );
  }
}