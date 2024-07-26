import 'package:flutter/material.dart';

closeKeyBoard(){
   FocusManager.instance.primaryFocus?.unfocus();
}