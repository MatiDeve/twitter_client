import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}