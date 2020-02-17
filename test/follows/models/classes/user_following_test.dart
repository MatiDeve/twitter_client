import 'package:test/test.dart';
import 'package:twitter_client/follows/models/classes/user_following.dart';

void main() {
  group("UserFollowing should", () {
    test("contain nickname and realname", () {
      String nickName = "MatiDeve";

      UserFollowing userFollowing = UserFollowing(nickName);

      expect(userFollowing.nickName, nickName);
    });
  });
}