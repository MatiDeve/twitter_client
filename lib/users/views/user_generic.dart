import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/users/providers/profile_user.dart';

import 'user_data.dart';
import 'user_edit.dart';

class UserGenericScreen extends StatelessWidget{

  final String profileUserNickName;
  final String localUserNickName;
  final Widget child;
  final bool isVisitingYourself;
  final List<Widget> appBarActions;
  final Widget floatingActions;

  const UserGenericScreen({Key key, @required this.profileUserNickName, @required this.localUserNickName, @required this.child, this.appBarActions =  const [], this.floatingActions, this.isVisitingYourself = false}) : super(key: key);

  Widget _buildEditButton(BuildContext context) => IconButton(
    onPressed: () {
      Navigator.of(context).pushNamed(
          UserEditScreen.routeName,
          arguments: UserEditScreenArgs(localUserNickName));
    },
    icon: Icon(Icons.edit),
  );

  @override
  Widget build(BuildContext context) {

    List<Widget> _appBarActions = List.from(appBarActions);

    if(isVisitingYourself) {
      _appBarActions.insert(0, _buildEditButton(context));
    }

    return ChangeNotifierProvider(
      create: (_) => ProfileUserProvider(localUserNickName),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(profileUserNickName),
          actions: _appBarActions.isEmpty ? null : _appBarActions,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UserDataScreen(profileUserNickName),
                  SizedBox(height: 12.0),
                  child,
                ],
              )
          ),
        ),
        floatingActionButton: floatingActions,
      ),
    );
  }
}