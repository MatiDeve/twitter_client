import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/follows/providers/follows.dart';
import 'package:twitter_client/follows/views/follows_provider_interface.dart';

class FollowsContainerScreen extends StatelessWidget {

  final String profileNickName;
  final String localUserNickName;

  FollowsContainerScreen(this.profileNickName, this.localUserNickName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FollowsProvider(localUserNickName),
      child: FollowsProviderInterface(profileNickName),
    );
  }
}
