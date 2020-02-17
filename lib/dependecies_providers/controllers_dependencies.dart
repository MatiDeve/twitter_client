import 'package:twitter_client/auth/controllers/login/form.dart';
import 'package:twitter_client/auth/controllers/login_status.dart';
import 'package:twitter_client/auth/controllers/register/form.dart';
import 'package:twitter_client/follows/controllers/follows.dart';
import 'package:twitter_client/tweets/controllers/post_tweet.dart';
import 'package:twitter_client/tweets/controllers/post_tweet/form.dart';
import 'package:twitter_client/tweets/controllers/user_tweets.dart';
import 'package:twitter_client/users/controllers/local_user.dart';
import 'package:twitter_client/users/controllers/update_user.dart';
import 'package:twitter_client/users/controllers/user_edit_form.dart';
import 'package:twitter_client/users/controllers/user_search_form.dart';

import 'models_dependencies.dart';

class ControllersDependencies {

  // Auth
  static LoginStatusController loginStatusControllerProvider() => LoginStatusController(ModelsDependencies.loginStatusModelProvider());
  static LoginFormController loginFormControllerProvider() => LoginFormController(ModelsDependencies.loginFormModelProvider());
  static RegisterFormController registerFormControllerProvider() => RegisterFormController(ModelsDependencies.registerFormModelProvider());

  // Follows
  static FollowsController followsControllerProvider(String localUser, {String visitedUser}) =>
      FollowsController(ModelsDependencies.followsModelProvider(), localUser, visitedUser: visitedUser);

  // Tweets
  static PostTweetFormController postTweetFormControllerProvider() => PostTweetFormController(ModelsDependencies.postTweetFormModelProvider());
  static PostTweetController postTweetControllerProvider() => PostTweetController(ModelsDependencies.postTweetModelProvider());
  static UserTweetsController userTweetsControllerProvider() => UserTweetsController(ModelsDependencies.userTweetsModelProvider());

  // Users
  static UserEditFormController userEditFormControllerProvider() => UserEditFormController(ModelsDependencies.userEditFormModelProvider());
  static UpdateUserController updateUserControllerProvider() => UpdateUserController(ModelsDependencies.updateUserModelProvider());
  static LocalUserController localUserControllerProvider(String localUserNickName) =>
      LocalUserController(localUserNickName, postTweetControllerProvider(), userTweetsControllerProvider());
  static UserSearchFormController userSearchFormControllerProvider() => UserSearchFormController(ModelsDependencies.userSearchFormModelProvider());
}