import 'package:flutter/foundation.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';

class Register implements FormData{
  final String nickName;
  final String realName;
  Register({@required this.nickName, @required this.realName});
}