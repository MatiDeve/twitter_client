import 'package:twitter_client/auth/models/login/form.dart';
import 'package:twitter_client/auth/models/login_status.dart';
import 'package:twitter_client/auth/models/register/form.dart';
import 'package:twitter_client/follows/models/api_follows.dart';
import 'package:twitter_client/follows/models/follows.dart';
import 'package:twitter_client/tweets/models/api_post_tweet.dart';
import 'package:twitter_client/tweets/models/api_user_tweets.dart';
import 'package:twitter_client/tweets/models/post_tweet.dart';
import 'package:twitter_client/tweets/models/post_tweet/form.dart';
import 'package:twitter_client/tweets/models/user_tweets.dart';
import 'package:twitter_client/users/models/api_update_user.dart';
import 'package:twitter_client/users/models/update_user.dart';
import 'package:twitter_client/users/models/user_edit_form.dart';
import 'package:twitter_client/users/models/user_search_form.dart';

class ModelsDependencies {

  // Auth
  static LoginStatusModel loginStatusModelProvider() => LoginStatusModel();
  static LoginFormModel loginFormModelProvider() => LoginFormModel();
  static RegisterFormModel registerFormModelProvider() => RegisterFormModel();

  //  Follows
  static FollowsModel followsModelProvider() => ApiFollowsModel();

  // Tweets
  static PostTweetFormModel postTweetFormModelProvider() => PostTweetFormModel();
  static PostTweetModel postTweetModelProvider() => ApiPostTweetModel();
  static UserTweetsModel userTweetsModelProvider() => ApiUserTweetsModel();

  // Users
  static UserEditFormModel userEditFormModelProvider() => UserEditFormModel();
  static UpdateUserModel updateUserModelProvider() => ApiUpdateUserModel();
  static UserSearchFormModel userSearchFormModelProvider() => UserSearchFormModel();
}