import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/users/views/home.dart';
import 'package:twitter_client/widgets/ui/loading_screen.dart';

import 'auth/providers/auth.dart';
import 'auth/views/auth.dart';

class WrapperScreen extends StatelessWidget {

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {

    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    return StreamBuilder(
      stream: _authProvider.isAuthStream,
      builder: (context, snapshot) =>
      snapshot.hasData
          ? (snapshot.data ? UserHomeScreen() : AuthScreen())
          : LoadingScreen(),
    );
  }
}