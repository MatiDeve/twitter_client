import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';
import 'package:twitter_client/users/providers/models/user.dart';
import 'package:twitter_client/users/providers/user.dart';

class MockUserModelProvider extends Mock implements UserModelProvider{}

void main() {
  group("user provider should", () {
    test("connect with userNickName", () {
      UserModelProvider _userModelProvider = MockUserModelProvider();
      when(_userModelProvider.savedNickNameStream).thenAnswer((
          _) => BehaviorSubject<String>.seeded(null));
      UserProvider _userProvider = UserProvider(_userModelProvider);
      verify(_userModelProvider.savedNickNameStream);
    });
  });
}