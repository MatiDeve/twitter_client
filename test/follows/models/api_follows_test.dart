import 'package:test/test.dart';
import 'package:twitter_client/follows/models/classes/follow.dart';
import 'package:twitter_client/follows/models/follows.dart';
import 'package:twitter_client/follows/models/api_follows.dart';

void main() {
  group("follows model should", () {

    FollowsModel _followsModel;

    setUp((){
      _followsModel = ApiFollowsModel();
    });

    test("follow, know if someone is following, and followers increment", () async {
      Follow followData = Follow("MatiDeve", "Lau.Leiva");

      Future.delayed(Duration(milliseconds: 500), () async {
        await _followsModel.getUserFollowers(followData.userFollowing);
        await _followsModel.follow(followData);
        var event = await _followsModel.isFollowerStream.take(1).toList();
        expect(event[0], true);
      });

      var events = await _followsModel.userFollowersStream.take(2).toList();
      expect(events[1].length, events[0].length + 1);
    });

    test("get user's followers (expecting one)", () async {
      await _followsModel.getUserFollowers("Lau.Leiva");
      var events = await _followsModel.userFollowersStream.take(1).toList();
      expect(events[0].length, 1);
      expect(events[0][0].nickName, "MatiDeve");
    });

    test("get user's followers (expecting nothing)", () async {
      await _followsModel.getUserFollowers("MatiDeve");
      var events = await _followsModel.userFollowersStream.take(1).toList();
      expect(events[0].length, 0);
    });

    test("get user's followings (expecting one)", () async {
      await _followsModel.getUserFollowings("MatiDeve");
      var events = await _followsModel.userFollowingsStream.take(1).toList();
      expect(events[0].length, 1);
      expect(events[0][0].nickName, "Lau.Leiva");
    });

    test("get user's followings (expecting nothing)", () async {
      await _followsModel.getUserFollowings("Lau.Leiva");
      var events = await _followsModel.userFollowingsStream.take(1).toList();
      expect(events[0].length, 0);
    });
  });
}



