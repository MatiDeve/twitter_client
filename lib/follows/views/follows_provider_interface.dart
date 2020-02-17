import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/follows/providers/follows.dart';
import 'package:twitter_client/follows/views/follows_data.dart';

class FollowsProviderInterface extends StatelessWidget {

  final String profileNickName;

  const FollowsProviderInterface(this.profileNickName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FollowsProvider followsProvider = Provider.of<FollowsProvider>(context);

    return FollowsDataScreen(profileNickName: profileNickName, localUserNickName: followsProvider.localUserNickName);
  }
}
