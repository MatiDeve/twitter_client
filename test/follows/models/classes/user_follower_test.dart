import 'package:test/test.dart';
import 'package:twitter_client/follows/models/classes/user_follower.dart';

void main() {
  group("UserFollower should", () {
    test("contain nickname and realname", () {
      String nickName = "MatiDeve";

      UserFollower userFollower = UserFollower(nickName);

      expect(userFollower.nickName, nickName);
    });
  });
}