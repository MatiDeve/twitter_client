import 'package:flutter/material.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/tweets/models/post_tweet/classes/content.dart';
import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';
import 'package:twitter_client/widgets/helpers/forms/views/custom-form-field.dart';

class PostTweet extends StatelessWidget {
  final String userNickName;
  final Function postTweet;

  PostTweet({Key key, this.userNickName, this.postTweet}) : super(key: key);

  final FormController _postTweetFormController = ControllersDependencies.postTweetFormControllerProvider();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  List<Widget> _buildFields() {
    return _postTweetFormController
        .getFormFields()
        .map((field) => CustomFormField(field))
        .toList();
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildFields(),
      ),
    );
  }

  Future<bool> _submit() async {
    if(!_formKey.currentState.validate()) return false;

    Content formContent = _postTweetFormController.data;
    await postTweet(formContent);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Write your tweet"),
      content: _buildForm(),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Ready"),
          onPressed: () async {
            if(await _submit())
              Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
