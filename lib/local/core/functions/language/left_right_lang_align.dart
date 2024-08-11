import 'package:flutter/material.dart';

Alignment leftRightLangAlign(String selectedLocale) {
  return selectedLocale == "en" ? Alignment.centerLeft : Alignment.centerRight;
}
