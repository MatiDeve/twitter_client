import 'package:twitter_client/follows/models/classes/follow.dart';
import 'package:twitter_client/follows/models/classes/user_follower.dart';
import 'package:twitter_client/follows/models/classes/user_following.dart';
import 'package:twitter_client/follows/models/follows.dart';

//TODO Separar en dos, uno para localUser y otro para local + visited

class FollowsController {
  final FollowsModel _followsModel;
  final String _localUser;
  final String visitedUser;

  FollowsController(this._followsModel, this._localUser, {this.visitedUser}){
    refresh();
  }

  Stream<List<UserFollower>> get userFollowersStream => _followsModel.userFollowersStream;
  Stream<List<UserFollowing>> get userFollowingsStream => _followsModel.userFollowingsStream;
  Stream<bool> get isFollowerStream => _followsModel.isFollowerStream;

  void refresh() {
    _getUserFollowers();
    _getUserFollowings();
    _isFollower();
  }

  void follow() async {
    if(visitedUser == null) return null;

    Follow followData = Follow(_localUser, visitedUser);
    await _followsModel.follow(followData);
    _isFollower();
  }

  Future<Null> _isFollower() async {
    if(visitedUser == null) return null;
    Follow followData = Follow(_localUser, visitedUser);
    await _followsModel.isFollower(followData);
  }

  Future<Null> _getUserFollowers() async =>
      await _followsModel.getUserFollowers(visitedUser ?? _localUser);

  Future<Null> _getUserFollowings() async =>
      await _followsModel.getUserFollowings(visitedUser ?? _localUser);

  void dispose() {
    _followsModel.dispose();
  }


}