import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/users/providers/models/user.dart';
import 'package:twitter_client/users/providers/user.dart';

import 'waiting_for_user.dart';

class UserHomeScreen extends StatelessWidget {

  final UserModelProvider _userModelProvider = UserModelProvider();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider(_userModelProvider);

    return ChangeNotifierProvider(
      create: (_) => userProvider,
      child: WaitingForUser(),
    );
  }
}

