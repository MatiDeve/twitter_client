import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator()
      ),
    );
  }
}