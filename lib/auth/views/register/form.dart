import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_client/auth/controllers/register/form.dart';
import 'package:twitter_client/auth/providers/auth.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';

import '../form.dart';

class RegisterForm extends StatelessWidget {

  final RegisterFormController _registerFormController = ControllersDependencies.registerFormControllerProvider();

  @override
  Widget build(BuildContext context) {

    final AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);

    return FormBuilder(
      submitButtonText: "Register",
      formController: _registerFormController,
      errorStream: authProvider.registerErrorStream,
      onSubmit: authProvider.register,
    );
  }
}
