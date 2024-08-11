import 'package:flutter/material.dart';

class AccountPagesModel {
  final String title;
  final IconData icon;
  final String? route;
  final String? link;
  AccountPagesModel(
      {required this.title, required this.icon, this.route, this.link});
}
