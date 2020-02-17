import 'package:flutter/material.dart';
import 'package:twitter_client/widgets/ui/loading.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Loading..."),
      ),
      body: Loading(),
    );
  }
}
