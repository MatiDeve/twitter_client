import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:twitter_client/auth/providers/models/classes/login.dart';
import 'package:twitter_client/auth/providers/models/classes/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_client/shared/configs.dart';

class AuthProviderModel {

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  final BehaviorSubject<bool> _isAuthSubject = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get isAuthStream => _isAuthSubject.stream;

  void checkSessionsSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _userNickName = prefs.getString("nickName");

    if(_userNickName != null)
      _notifyUserAuthentificated();
  }

  Future<bool> login(Login loginData) async {
    Map<String, String> data = {
      "nickName": loginData.nickName,
      "realName": ""
    };

    print("open login");
    http.Response response = await _registerRequest(data);
    print("close login");

    _isAuth = response.statusCode == 500 ? true : false;

    if(_isAuth)
      _saveUserSession(loginData.nickName);

    return _isAuth;
  }

  Future<bool> register(Register registerData) async {
    Map<String, String> data = {
      "nickName": registerData.nickName,
      "realName": registerData.realName
    };

    print("open register");
    http.Response response = await _registerRequest(data);
    print("close register");

    _isAuth = response.statusCode == 201 ? true : false;

    if(_isAuth)
      _saveUserSession(registerData.nickName);

    return _isAuth;
  }

  void logout() {
    _removeUserSession();
    _isAuthSubject.add(false);
  }

  Future<http.Response> _registerRequest(Map<String, dynamic> data) async {
    return await http.post(
      Configs.API_URL + "users",
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(data),
    );
  }

  void _saveUserSession(String nickName) async {

    _notifyUserAuthentificated();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nickName", nickName);
  }

  void _removeUserSession() async {

    _notifyUserAuthentificated();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("nickName", null);
  }

  void _notifyUserAuthentificated() {
    _isAuthSubject.add(true);
  }

  void dispose() {
    _isAuthSubject.close();
  }
}