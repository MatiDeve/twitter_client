import 'form-data.dart';
import 'form-field-data.dart';

abstract class FormModel {

  List<FormFieldData> getFormFields();
  FormData get data;
}