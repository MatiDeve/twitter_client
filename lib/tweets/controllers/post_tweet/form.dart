import 'package:twitter_client/widgets/helpers/forms/controllers/form.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-model.dart';

class PostTweetFormController implements FormController {

  final FormModel _formModel;

  PostTweetFormController(this._formModel);

  @override
  FormData get data => _formModel.data;

  @override
  List<FormFieldData> getFormFields() => _formModel.getFormFields();
}