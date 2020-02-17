import 'package:test/test.dart';
import 'package:twitter_client/follows/providers/follows.dart';

void main() {
  group("Follows provider should", () {
    test("return localUser", (){
      String nickName = "MatiDeve";
      expect(FollowsProvider(nickName), nickName);
    });
  });
}