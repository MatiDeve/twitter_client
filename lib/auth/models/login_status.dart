class LoginStatusModel {
  bool _initialData = true;
  bool get initialData => _initialData;

  bool _loginStatus = true;

  bool toggle() {
    _loginStatus = !_loginStatus;
    return _loginStatus;
  }
}