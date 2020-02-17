import 'package:flutter/material.dart';
import 'package:twitter_client/dependecies_providers/controllers_dependencies.dart';
import 'package:twitter_client/users/views/visited_user.dart';
import 'package:twitter_client/users/controllers/user_search_form.dart';
import 'package:twitter_client/users/models/classes/user_search.dart';
import 'package:twitter_client/widgets/helpers/forms/views/custom-form-field.dart';

class UserSearchDialog extends StatelessWidget {

  final String _localUser;

  UserSearchDialog(this._localUser, {Key key,}) : super(key: key);

  final UserSearchFormController _userSearchFormController = ControllersDependencies.userSearchFormControllerProvider();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Widget> _buildFields() {
    return _userSearchFormController
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

  Future<Null> _submit(BuildContext context) async {
    if(!_formKey.currentState.validate()) return;

    UserSearch user = _userSearchFormController.data;

    Navigator.of(context).pushNamed(VisitedUserScreen.routeName, arguments: VisitedUserScreenArgs(profileUserNickName: user.nickName, localUserNickName: _localUser));
    return;
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Search"),
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
            await _submit(context);
          },
        ),
      ],
    );
  }
}