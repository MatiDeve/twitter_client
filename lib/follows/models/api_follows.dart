import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:twitter_client/shared/configs.dart';
import 'package:twitter_client/follows/models/classes/follow.dart';
import 'classes/user_follower.dart';
import 'classes/user_following.dart';
import 'follows.dart';

class ApiFollowsModel implements FollowsModel{

  BehaviorSubject<List<UserFollower>> _userFollowersSubject = BehaviorSubject<List<UserFollower>>();
  @override
  Stream<List<UserFollower>> get userFollowersStream => _userFollowersSubject.stream;

  BehaviorSubject<List<UserFollowing>> _userFollowingsSubject = BehaviorSubject<List<UserFollowing>>();
  @override
  Stream<List<UserFollowing>> get userFollowingsStream => _userFollowingsSubject.stream;

  BehaviorSubject<bool> _isFollowerSubject = BehaviorSubject<bool>();
  @override
  Stream<bool> get isFollowerStream => _isFollowerSubject.stream;

  @override
  Future<Null> follow(Follow followData) async {
    Map<String, String> data = {
      "followerNickName": followData.userFollower,
      "followingNickName": followData.userFollowing,
    };


    print("open follow");
    await http.post(
        Configs.API_URL + "follows",
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(data),
    );
    print("close follow");

    getUserFollowers(followData.userFollowing);
  }

  @override
  Future<Null> isFollower(Follow followData) async {

    String url = Configs.API_URL + "follows/isFollower?followerNickName=${followData.userFollower}&followingNickName=${followData.userFollowing}";

    print("open isFollower");
    http.Response response = await http
        .get(url);
    print("close isFollower");

    Map<String, dynamic> body = json.decode(response.body);
    _isFollowerSubject.add(body["follower"]);
  }
  
  @override
  Future<Null> getUserFollowers(String nickName) async {
    print("open user followers");
    http.Response response = await http.get(Configs.API_URL + "follows/"+nickName+"/followers");
    print("close user followers");
    Map<String, dynamic> responseData = json.decode(response.body);
    _userFollowersSubject.add(redisUsersToUserFollowers(responseData));
  }

  @override
  Future<Null> getUserFollowings(String nickName) async {
    print("open user followings");
    http.Response response = await http.get(Configs.API_URL + "follows/"+nickName+"/followings");
    print("close user followings");
    Map<String, dynamic> responseData = json.decode(response.body);

    _userFollowingsSubject.add(redisUsersToUserFollowings(responseData));
  }

  List<UserFollower> redisUsersToUserFollowers(Map<String, dynamic> responseData) =>
      responseData["users"]
          .map<UserFollower>((user) => UserFollower(user))
          .toList();

  List<UserFollowing> redisUsersToUserFollowings(Map<String, dynamic> responseData) =>
      responseData["users"]
          .map<UserFollowing>((user) => UserFollowing(user))
          .toList();

  void dispose() {
    _userFollowersSubject.close();
    _userFollowingsSubject.close();
  }
}