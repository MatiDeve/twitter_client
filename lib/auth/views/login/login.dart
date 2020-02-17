import 'package:flutter/material.dart';
import 'package:twitter_client/auth/views/login/form.dart';
import 'package:twitter_client/widgets/ui/link-button.dart';

class LoginScreen extends StatelessWidget {

  final Function toggleStatus;

  const LoginScreen({
    Key key,
    @required this.toggleStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LoginForm(),
        SizedBox(height: 16.0),
        LinkButton(
          onPressed: toggleStatus,
          text: "Don't have you an account? Register!",
        )
      ],
    );
  }
}