import 'package:twitter_client/follows/models/classes/follow.dart';

import 'classes/user_follower.dart';
import 'classes/user_following.dart';

abstract class FollowsModel {
  Stream<List<UserFollower>> get userFollowersStream;
  Stream<List<UserFollowing>> get userFollowingsStream;
  Stream<bool> get isFollowerStream => null;

  Future<Null> follow(Follow followData);
  Future<Null> isFollower(Follow followData);
  Future<Null> getUserFollowers(String nickName);
  Future<Null> getUserFollowings(String nickName);
  void dispose();
}