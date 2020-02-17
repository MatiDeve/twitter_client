import 'package:flutter/src/widgets/editable_text.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class ContentField extends FormFieldData {

  ContentField() : super(maxLines: null, maxLength: 140);

  TextEditingController _controller = TextEditingController();

  @override
  TextEditingController get getController => _controller;

  @override
  String get getLabelText => "Content";

  @override
  String validate(String value) {
    if(value.isEmpty)
      return "Content is required.";
    return null;
  }
}