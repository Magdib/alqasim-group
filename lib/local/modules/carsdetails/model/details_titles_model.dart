import 'package:flutter/material.dart';

class DetailsTitlesModel {
  final String title;
  final IconData icon;
  final double? size;
  bool addPadding;
  DetailsTitlesModel({
    required this.title,
    required this.icon,
    this.addPadding = true,
    this.size,
  });
}
