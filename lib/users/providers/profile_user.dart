import 'package:flutter/foundation.dart';

class ProfileUserProvider extends ChangeNotifier {
  final String localUserNickName;

  ProfileUserProvider(this.localUserNickName);
}