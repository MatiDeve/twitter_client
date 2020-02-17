import 'package:flutter/material.dart';
import 'package:twitter_client/auth/controllers/login_status.dart';
import 'package:twitter_client/auth/views/login/login.dart';
import 'package:twitter_client/auth/views/register/register.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  LoginStatusController loginStatus = ControllersDependencies.loginStatusControllerProvider();

  @override
  void dispose() {
    loginStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: StreamBuilder(
          initialData: loginStatus.initialData,
          stream: loginStatus.stream,
          builder: (context, AsyncSnapshot<bool> snapshot)
            => Text(snapshot.data ? "Login" : "Register"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: StreamBuilder(
            initialData: loginStatus.initialData,
            stream: loginStatus.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.hasData)
                return snapshot.data
                    ? LoginScreen(
                      toggleStatus: loginStatus.toggle,
                    )
                    : RegisterScreen(
                      toggleStatus: loginStatus.toggle,
                    );

              return Loading();
            },
          )
        ),
      )
    );
  }
}