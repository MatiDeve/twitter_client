import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:twitter_client/auth/providers/models/auth.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';
import 'package:twitter_client/auth/providers/auth.dart';

class MockAuthProviderModel extends Mock implements AuthProviderModel{}

void main() {

  group("auth provider should", () {

    AuthProviderModel _authModel;
    AuthProvider _authProvider;

    Login loginData = Login(nickName: "Jorge");
    Register registerData = Register(nickName: "Jorge", realName: "Jorge Gomez");

    setUp((){


      Future<bool> _futureBool(bool v) async {
        return Future.delayed(const Duration(milliseconds: 500), () => v);
      }

      _authModel = MockAuthProviderModel();
      when(_authModel.register(registerData)).thenAnswer((_) => _futureBool(true));
      when(_authModel.login(loginData)).thenAnswer((_) => _futureBool(true));

      _authProvider = AuthProvider(_authModel);
    });

    test("connect with model's login", (){
      _authProvider.login(loginData);
      verify(_authModel.login(loginData));
    });

    test("connect with model's register", (){
      _authProvider.register(registerData);
      verify(_authModel.register(registerData));
    });

    test("connect with model's logout", (){
      _authProvider.logout();
      verify(_authModel.logout());
    });

    test("connect with isAuthStream", (){
      _authProvider.isAuthStream;
      verify(_authModel.isAuthStream);
    });
  });
}