import 'package:flutter/material.dart';
import 'package:twitter_client/auth/views/register/form.dart';
import 'package:twitter_client/widgets/ui/link-button.dart';

class RegisterScreen extends StatelessWidget {

  final Function toggleStatus;

  const RegisterScreen({
    Key key,
    @required this.toggleStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RegisterForm(),
        SizedBox(height: 16.0),
        LinkButton(
          onPressed: toggleStatus,
          text: "Don't have you an account? Register!",
        )
      ],
    );
  }
}