import 'package:get/get.dart';

validation(
    {required String value,
    required int minValue,
    required int maxValue,
    required String typeOfValidation}) {
  if (typeOfValidation == 'name') {
    if (!GetUtils.isUsername(value)) {
      return 'رجاءً قم بإدخال اسم صالح';
    }
  }
  if (typeOfValidation == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'رجاءً قم بإدخال بريد الكرتوني صالح';
    }
  }
  if (typeOfValidation == 'Number') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'رجاءً قم بإدخال رقم صالح';
    }
  }
  if (value.isEmpty) {
    return "هذا الحقل مطلوب";
  }
  if (value.length < minValue) {
    return 'لا يمكن ان يكون أقل من $minValue أحرف';
  }
  if (value.length > maxValue) {
    return "لا يمكن ان يكون أكثر من $maxValue أحرف";
  }
}

confirmValidate(String passwordValue, String confirmPasswordValue) {
  if (confirmPasswordValue != passwordValue ||
      confirmPasswordValue.isEmpty ||
      passwordValue.isEmpty) {
    return "كلمات المرور غير متوافقة";
  }
}
