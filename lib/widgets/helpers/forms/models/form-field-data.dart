import 'package:flutter/widgets.dart';

abstract class FormFieldData {
  FormFieldData({this.maxLines = 1, this.maxLength});

  String validate(String value);
  String get getLabelText;
  TextEditingController get getController;

  final int maxLines;
  final int maxLength;
}