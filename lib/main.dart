import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/global/binding/app_binding.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/localization/localization.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/core/themes/theme.dart';

import 'global/core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              translations: AppLocalization(),
              getPages: pages,
              initialBinding: AppBindings(),
              locale: getLanguage(),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) =>
                  const Locale("en"),
              theme: AppTheme.lightsTheme);
        });
  }
}
