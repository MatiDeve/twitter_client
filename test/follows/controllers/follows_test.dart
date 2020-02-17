import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:twitter_client/follows/controllers/follows.dart';
import 'package:twitter_client/follows/models/follows.dart';

class MockFollowsModel extends Mock implements FollowsModel{}

void main() {

  group("Follows controller should", () {

    FollowsModel _followsModel;
    FollowsController _followsController;
    String localUser = "MatiDeve";

    setUp((){
      _followsModel = MockFollowsModel();
      _followsController = FollowsController(_followsModel, localUser);
    });

    test("connect with followers stream", () {
      _followsController.userFollowersStream;
      verify(_followsModel.userFollowersStream).called(1);
    });

    test("connect with followings stream", () {
      _followsController.userFollowingsStream;
      verify(_followsModel.userFollowingsStream).called(1);
    });

    test("connect with isFollower stream", () {
      _followsController.isFollowerStream;
      verify(_followsModel.isFollowerStream).called(1);
    });
  });

  group("Follows controller with localUser should", () {

    FollowsModel _followsModel;
    FollowsController _followsController;
    String localUser = "MatiDeve";

    setUp((){
      _followsModel = MockFollowsModel();
      _followsController = FollowsController(_followsModel, localUser);
    });

    test("not connect with followings model's follow", () {
      _followsController.follow();
      verifyNever(_followsModel.follow(any));
    });

    test("not connect with followings model's follow", () {
      verifyNever(_followsModel.isFollower(any));
    });

    test("connect with followings model's getFollowers", () {
      verify(_followsModel.getUserFollowers(localUser)).called(1);
    });

    test("connect with followings model's getFollowings", () {
      verify(_followsModel.getUserFollowings(localUser)).called(1);
    });
  });


  group("Follows controller with localUser and visitedUser should", () {

    FollowsModel _followsModel;
    FollowsController _followsController;
    String localUser = "MatiDeve";
    String visitedUser = "Lau.Leiva";

    setUp((){
      _followsModel = MockFollowsModel();
      _followsController = FollowsController(_followsModel, localUser, visitedUser: visitedUser);
    });

    test("connect with followings model's follow", () {
      _followsController.follow();
      verify(_followsModel.follow(any)).called(1);
    });

    test("connect with followings model's follow", () {
      verify(_followsModel.isFollower(any)).called(1);
    });

    test("connect with followings model's getFollowers", () {
      verify(_followsModel.getUserFollowers(visitedUser)).called(1);
    });

    test("connect with followings model's getFollowings", () {
      verify(_followsModel.getUserFollowings(visitedUser)).called(1);
    });
  });
}