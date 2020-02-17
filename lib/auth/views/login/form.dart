import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/auth/controllers/login/form.dart';
import 'package:twitter_client/auth/providers/auth.dart';
import 'package:twitter_client/auth/views/form.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';

class LoginForm extends StatelessWidget {

  final LoginFormController _loginFormController = ControllersDependencies.loginFormControllerProvider();

  @override
  Widget build(BuildContext context) {

    final AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    Stream<String> _loginErrorStream = authProvider.loginErrorStream;

    return FormBuilder(
      submitButtonText: "Login",
      formController: _loginFormController,
      errorStream: _loginErrorStream,
      onSubmit: authProvider.login,
    );
  }
}
