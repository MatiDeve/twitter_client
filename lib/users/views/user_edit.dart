import 'package:flutter/material.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/users/controllers/update_user.dart';
import 'package:twitter_client/users/controllers/user_edit_form.dart';
import 'package:twitter_client/users/models/classes/user_edit.dart';
import 'package:twitter_client/widgets/helpers/forms/views/custom-form-field.dart';

class UserEditScreen extends StatelessWidget {

  static const String routeName = "/users/edit";

  final UserEditFormController _userEditFormController = ControllersDependencies.userEditFormControllerProvider();
  final UpdateUserController _updateUserController = ControllersDependencies.updateUserControllerProvider();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Widget> _buildFields() {
    return _userEditFormController
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

  Future<bool> _submit(String localUserNickName) async {
    if(!_formKey.currentState.validate()) return false;

    UserEdit user = _userEditFormController.data;

    await _updateUserController.update(localUserNickName, user.updatedRealName);
    return true;
  }

  @override
  Widget build(BuildContext context) {

    UserEditScreenArgs arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Edit Real Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            _buildForm(),
            RaisedButton(
              onPressed: () async {
                if(await _submit(arguments.localUserNickName))
                  Navigator.of(context).pop();
              },
              child: Text("Change my name"),
            ),
          ],
        ),
      ),
    );
  }
}

class UserEditScreenArgs {
  final String localUserNickName;
  UserEditScreenArgs(this.localUserNickName);
}