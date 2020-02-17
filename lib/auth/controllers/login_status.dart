import 'dart:async';

import 'package:twitter_client/auth/models/login_status.dart';

class LoginStatusController {

  final LoginStatusModel loginStatusModel;
  var _loginStatusController = StreamController<bool>.broadcast();

  LoginStatusController(this.loginStatusModel);

  bool get initialData => loginStatusModel.initialData;

  Stream<bool> get stream => _loginStatusController.stream;

  void toggle() {
    _loginStatusController.sink.add(loginStatusModel.toggle());
  }

  void dispose() {
    _loginStatusController.close();
  }
}