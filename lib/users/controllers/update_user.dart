import 'package:twitter_client/users/models/classes/user.dart';
import 'package:twitter_client/users/models/update_user.dart';

class UpdateUserController {
  final UpdateUserModel _updateUserModel;
  UpdateUserController(this._updateUserModel);

  Future<Null> update(String nickName, String realName) async {
    User user = User(nickName, realName);
    await _updateUserModel.update(user);
  }
}