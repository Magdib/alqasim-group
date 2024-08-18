import 'package:flutter/widgets.dart';

class FormsDataModel {
  final String hint;
  final TextEditingController textEditingController;
  final bool isPassword;
  final String validation;
  FormsDataModel(
      {required this.hint,
      required this.validation,
      this.isPassword = false,
      required this.textEditingController});
}
