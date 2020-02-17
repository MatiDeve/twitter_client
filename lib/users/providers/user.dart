import 'package:flutter/foundation.dart';
import 'package:twitter_client/users/providers/models/user.dart';

class UserProvider with ChangeNotifier{
  final UserModelProvider _userModelProvider;
  String _savedUserNickName;
  String get savedUserNickName => _savedUserNickName;

  UserProvider(this._userModelProvider){
    _userModelProvider.savedNickNameStream.listen((String userNickName) {
      _savedUserNickName = userNickName;
      notifyListeners();
    });
  }

  void dispose() {
    _userModelProvider.dispose();
    super.dispose();
  }
}