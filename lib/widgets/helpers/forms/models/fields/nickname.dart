import 'package:flutter/widgets.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class NickNameField extends FormFieldData {

  final TextEditingController _controller = TextEditingController();

  @override
  String get getLabelText => "Nick Name";

  @override
  TextEditingController get getController => _controller;


  @override
  String validate(String value) {
    if(value.isEmpty)
      return "Nickname is required.";
    if(value.length < 6)
      return "Min. length is six.";
    if(value.contains(" "))
      return "Nickname musn't have spaces.";
    return null;
  }
}