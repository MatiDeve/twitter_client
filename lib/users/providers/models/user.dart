import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModelProvider {
  final BehaviorSubject<String> _savedNickNameSubject = BehaviorSubject<String>.seeded(null);
  Stream<String> get savedNickNameStream => _savedNickNameSubject.stream;

  UserModelProvider(){
    _getSavedUserNickName();
  }

  Future<Null> _getSavedUserNickName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedNickNameSubject.add(prefs.getString("nickName"));
  }

  void dispose() {
    _savedNickNameSubject.close();
  }
}