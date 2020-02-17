import 'package:test/test.dart';
import 'package:twitter_client/auth/controllers/login_status.dart';
import 'package:twitter_client/auth/models/login_status.dart';

void main() {
  group("Login status", (){

    LoginStatusController loginStatus;

    setUp(() {
      loginStatus = LoginStatusController(LoginStatusModel());
    });

    test("Initial data is true", () {
      expect(loginStatus.initialData, true);
    });

    test("expects toggle when toggle() is called", () {

      expectLater(loginStatus.stream, emitsInOrder([false, true, false]));

      loginStatus.toggle();
      loginStatus.toggle();
      loginStatus.toggle();
    });
  });
}