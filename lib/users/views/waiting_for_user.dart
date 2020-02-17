import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/users/providers/user.dart';
import 'package:twitter_client/widgets/ui/loading_screen.dart';

import 'user_profile.dart';

class WaitingForUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return userProvider.savedUserNickName == null
        ? LoadingScreen()
        : UserProfileScreen(userProvider.savedUserNickName);
  }
}