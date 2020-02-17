import 'package:flutter/material.dart';
import 'package:twitter_client/follows/controllers/follows.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/follows/models/classes/user.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

import 'follows_box.dart';

class FollowsDataScreen extends StatefulWidget {

  final String profileNickName;
  final String localUserNickName;
  FollowsDataScreen({@required this.profileNickName, @required this.localUserNickName});

  @override
  _FollowsDataScreenState createState() => _FollowsDataScreenState();
}

class _FollowsDataScreenState extends State<FollowsDataScreen> {

  FollowsController _followsController;
  bool isVisitingYourself;

  @override
  void initState() {
    isVisitingYourself = widget.localUserNickName == widget.profileNickName;
    _followsController = ControllersDependencies
        .followsControllerProvider(widget.localUserNickName, visitedUser: isVisitingYourself ? null : widget.profileNickName);
    super.initState();
  }

  @override
  void dispose() {
    _followsController.dispose();
    super.dispose();
  }

  Widget _buildNumber(Stream<List<User>> stream, String type) {
    return Expanded(
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) => snapshot.hasData
            ? FollowsBox(widget.profileNickName, type, snapshot.data, _followsController)
            : Loading(),
      ),
    );
  }

  Widget _followsNumber() => Row(
      children: <Widget>[
        _buildNumber(_followsController.userFollowingsStream, "Followings"),
        _buildNumber(_followsController.userFollowersStream, "Followers"),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return isVisitingYourself
        ? _followsNumber()
        : Column(
          children: <Widget>[
            FollowButton(isFollowerStream: _followsController.isFollowerStream, follow: _followsController.follow,),
            _followsNumber(),
          ],
        );
  }
}

class FollowButton extends StatelessWidget {

  final Function follow;
  final Stream<bool> isFollowerStream;

  const FollowButton({Key key, @required this.follow, @required this.isFollowerStream}) : super(key: key);

  Widget _buildButton(BuildContext context, bool isFollower) {
    return RaisedButton(
      onPressed: () {
        if(!isFollower)
          follow();
      },
      child: Text(isFollower ? "Unfollow" : "Follow"),
      color: isFollower ? Theme.of(context).accentColor : Colors.white,
      textColor: isFollower ? Colors.white : Theme.of(context).accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: isFollowerStream,
      builder: (context, snapshot) =>
        snapshot.hasData
          ? _buildButton(context, snapshot.data)
          : Loading(),
    );
  }
}

