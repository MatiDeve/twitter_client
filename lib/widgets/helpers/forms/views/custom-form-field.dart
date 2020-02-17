import 'package:flutter/material.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

class CustomFormField extends StatelessWidget {

  final FormFieldData fieldData;

  const CustomFormField(this.fieldData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldData.getController,
      validator: fieldData.validate,
      decoration: InputDecoration(
          labelText: fieldData.getLabelText
      ),
      maxLength: fieldData.maxLength,
      maxLines: fieldData.maxLines,
    );
  }
}