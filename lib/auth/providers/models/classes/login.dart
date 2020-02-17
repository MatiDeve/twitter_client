import 'package:flutter/foundation.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';

class Login implements FormData{
  final String nickName;
  Login({@required this.nickName});
}