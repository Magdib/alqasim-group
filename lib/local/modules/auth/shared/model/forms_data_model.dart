import 'package:flutter/widgets.dart';

class FormsDataModel {
  final String hint;
  final TextEditingController textEditingController;
  final bool isPassword;
  FormsDataModel(
      {required this.hint,
      this.isPassword = false,
      required this.textEditingController});
}
