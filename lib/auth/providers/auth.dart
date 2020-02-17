import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:twitter_client/auth/providers/models/auth.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';

class AuthProvider extends ChangeNotifier {
  final AuthProviderModel _authProviderModel;

  AuthProvider(this._authProviderModel);

  Stream<bool> get isAuthStream => _authProviderModel.isAuthStream;

  StreamController<String> _loginErrorController = StreamController<String>.broadcast();
  Stream<String> get loginErrorStream => _loginErrorController.stream;

  StreamController<String> _registerErrorController = StreamController<String>.broadcast();
  Stream<String> get registerErrorStream => _registerErrorController.stream;

  void checkSessionSaved() async {
    _authProviderModel.checkSessionsSaved();
  }

  Future<void> login(Login loginData) async {
    bool success = await _authProviderModel.login(loginData);
    if (!success) {
      print("aca");
      _loginErrorController.add("Nickname invalid.");
    }
  }

  Future<void> register(Register registerData) async {
    bool success = await _authProviderModel.register(registerData);
    if (!success)
      _registerErrorController.add("Nickname in use.");
  }

  void logout() {
    _authProviderModel.logout();
  }

  @override
  void dispose() {
    _loginErrorController.close();
    _registerErrorController.close();
    super.dispose();
  }
}