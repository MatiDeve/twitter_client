import 'classes/user.dart';

abstract class UpdateUserModel {
  Future<Null> update(User user) {}
}