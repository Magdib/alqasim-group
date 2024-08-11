import 'package:get/get.dart';
import 'package:proj/local/core/localization/ar_en_text.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {"ar": AppLanguagesText.ar, "en": AppLanguagesText.en};
}
