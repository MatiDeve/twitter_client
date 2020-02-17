import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {

  final Widget child;

  const GenericCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.2),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
