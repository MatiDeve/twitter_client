import 'package:flutter/material.dart';
import 'package:twitter_client/users/views/user_search_dialog.dart';

class UserSearchButton extends StatelessWidget {

  final String _localUser;

  const UserSearchButton(this._localUser, {Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.search),
      heroTag: "Search",
      onPressed: () {
        showDialog(context: context, builder: (_) => UserSearchDialog(_localUser));
      },
    );
  }
}