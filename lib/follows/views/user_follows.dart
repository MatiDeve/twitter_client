import 'package:flutter/material.dart';
import 'package:twitter_client/follows/models/classes/user.dart';
import 'package:twitter_client/users/views/visited_user.dart';
import 'package:twitter_client/widgets/ui/DefaultMessage.dart';
import 'package:twitter_client/widgets/ui/generic_card.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

class UserFollowsScreen extends StatelessWidget {

  final String profileUserNickName;
  final String localUserNickName;
  final String typeText;
  final Stream<List<User>> userStream;
  final Function refresh;

  const UserFollowsScreen({Key key,
    @required this.profileUserNickName,
    @required this.localUserNickName,
    @required this.typeText,
    @required this.userStream,
    @required this.refresh}) : super(key: key);

  Widget _userText(String nickName) =>
      Text(nickName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));

  Widget _userCard(String nickName) =>
      GenericCard(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          child: _userText(nickName),
        ),
      );

  Widget _buildUser(BuildContext context, User user) =>
      GestureDetector(
        onTap: () {
          VisitedUserScreenArgs a = VisitedUserScreenArgs(profileUserNickName: user.nickName, localUserNickName: localUserNickName);
          Navigator.of(context).pushNamed(VisitedUserScreen.routeName, arguments: a).then((_) {
            refresh();
          });
        },
        child: _userCard(user.nickName),
      );

  List<Widget> _buildUsers(BuildContext context, List<User> users) =>
      users.map((user) => _buildUser(context, user)).toList();

  Widget _resolveData(BuildContext context, List<User> users) {
    if (users.isEmpty) {
      return DefaultMessage("You don't have "+typeText);
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: _buildUsers(context, users),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(profileUserNickName+": "+typeText),
      ),
      body: StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Loading();
          }else{
            return _resolveData(context, snapshot.data);
          }
        }
        ,
      ),
    );
  }
}