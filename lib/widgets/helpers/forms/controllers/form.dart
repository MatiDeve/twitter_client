import 'package:twitter_client/widgets/helpers/forms/models/form-data.dart';
import 'package:twitter_client/widgets/helpers/forms/models/form-field-data.dart';

abstract class FormController {
  FormData get data;
  List<FormFieldData> getFormFields();
}