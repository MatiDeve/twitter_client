import 'package:flutter/material.dart';

class DefaultMessage extends StatelessWidget {

  final String _text;

  const DefaultMessage( this._text, {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(_text),
      ),
    );
  }
}