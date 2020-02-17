import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';
import 'package:twitter_client/widgets/helpers/forms/views/custom-form-field.dart';

class FormBuilder extends StatefulWidget {

  final Stream<String> errorStream;
  final FormController formController;
  final String submitButtonText;
  final Function onSubmit;

  const FormBuilder({Key key, @required this.errorStream, @required this.formController, @required this.submitButtonText, @required this.onSubmit}) : super(key: key);

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StreamSubscription<String> _errorSubscription;

  List<Widget> _buildFields() {
    return widget.formController
        .getFormFields()
        .map((field) => CustomFormField(field))
        .toList();
  }

  List<Widget> _buildFormContent() {
    List<Widget> content = List<Widget>.from(_buildFields());
    content.add(
        RaisedButton(
          onPressed: () {
            if(_formKey.currentState.validate()){
              widget.onSubmit(widget.formController.data);
            }
          },
          child: Text(widget.submitButtonText),
        )
    );

    return content;
  }

  Widget _errorDialog(BuildContext context, String data){
    return AlertDialog(
      title: Text("Error"),
      content: Text(data),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok!"),
        )
      ],
    );
  }

  @override
  void dispose() {
    _errorSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _errorSubscription = widget.errorStream.listen((String data) {
      showDialog(
          context: context,
          builder: (context) => _errorDialog(context, data)
      );
    });

    return Form(
      key: _formKey,
      child: Column(
        children: _buildFormContent(),
      ),
    );
  }
}
