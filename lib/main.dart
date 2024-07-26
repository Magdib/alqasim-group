import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/core/constant/colors.dart';
import 'package:proj/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: pages,
      textDirection: TextDirection.rtl,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: AppColors.white),
    );
  }
}
