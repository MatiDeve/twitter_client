import 'package:test/test.dart';
import 'package:twitter_client/auth/models/login_status.dart';

void main() {
  group("Login status model", () {
    LoginStatusModel loginStatusModel;

    setUp(() {
      loginStatusModel = LoginStatusModel();
    });

    test("Initial data is true", () {
      expect(loginStatusModel.initialData, true);
    });

    test("expects toggle when toggle() is called", () {
      expect(loginStatusModel.toggle(), !loginStatusModel.initialData);
      expect(loginStatusModel.toggle(), loginStatusModel.initialData);
    });
  });
}