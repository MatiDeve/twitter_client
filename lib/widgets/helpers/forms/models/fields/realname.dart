import 'package:flutter/widgets.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class RealNameField extends FormFieldData {

  final TextEditingController _controller = TextEditingController();

  @override
  String get getLabelText => "Real Name";

  @override
  TextEditingController get getController => _controller;


  @override
  String validate(String value) {
    if(value.isEmpty)
      return "Realname is required.";
    return null;
  }
}