import 'package:flutter/material.dart';
import 'package:twitter_client/auth/providers/models/auth.dart';
import 'package:twitter_client/auth/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/users/views/user_edit.dart';
import 'package:twitter_client/wrapper.dart';

import 'follows/views/user_follows_container.dart';
import 'users/views/visited_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  final AuthProviderModel _authProviderModel = AuthProviderModel();
  AuthProvider _authProvider;

  @override
  void initState() {
    _authProvider = AuthProvider(_authProviderModel);
    _authProvider.checkSessionSaved();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _authProvider,
      child: MaterialApp(
        title: 'Twitter',
        theme: ThemeData(
          backgroundColor: Colors.grey[200],
          primarySwatch: Colors.indigo,
          buttonColor: Colors.indigo,
          buttonTheme: ButtonThemeData(
            minWidth: double.infinity,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        routes: {
          WrapperScreen.routeName: (context) => WrapperScreen(),
          UserFollowsContainerScreen.routeName: (context) => UserFollowsContainerScreen(),
          VisitedUserScreen.routeName: (context) => VisitedUserScreen(),
          UserEditScreen.routeName: (context) => UserEditScreen(),
        },
      ),
    );
  }
}
