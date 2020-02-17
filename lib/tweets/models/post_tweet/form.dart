import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

import 'classes/content.dart';
import 'fields/content.dart';

class PostTweetFormModel implements FormModel {

  FormFieldData _contentField = ContentField();

  @override
  // TODO: implement data
  FormData get data => Content(_contentField.getController.text);

  @override
  List<FormFieldData> getFormFields() {
    // TODO: implement getFormFields
    return [_contentField];
  }
}