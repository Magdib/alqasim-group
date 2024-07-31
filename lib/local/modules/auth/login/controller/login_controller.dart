import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signUpButtonGesture;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signUpButtonGesture = TapGestureRecognizer()
      ..onTap = () => Get.offNamed(AppRoutes.signUpPageRoute);
    formsData = [
      FormsDataModel(
          hint: "البريد الإلكتروني", textEditingController: emailController),
      FormsDataModel(
          hint: "كلمة المرور",
          isPassword: true,
          textEditingController: passwordController),
    ];
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    signUpButtonGesture.dispose();
    super.dispose();
  }
}
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:proj/global/core/class/app_toast.dart';
// import 'package:proj/local/core/routes/routes.dart';
// import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';

// class LoginController extends GetxController {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late List<FormsDataModel> formsData;
//   late TapGestureRecognizer signUpButtonGesture;
//   late FocusNode firstNode;
//   late FocusNode secondeNode;
//   late FocusNode thirdNode;
//   late FocusNode fourthNode;
//   late FocusNode fifthNode;
//   late FocusNode sixthNode;
//   late List<FocusNode> focusList;
//   String firstNumber = '';
//   String secondeNumber = '';
//   String thirdNumber = '';
//   String fourthNumber = '';
//   String fifthNumber = '';
//   String sixthNumber = '';
//   bool checkOTPValues() {
//     return firstNumber.isNotEmpty &&
//             secondeNumber.isNotEmpty &&
//             thirdNumber.isNotEmpty &&
//             fourthNumber.isNotEmpty &&
//             fifthNumber.isNotEmpty &&
//             sixthNumber.isNotEmpty
//         ? true
//         : false;
//   }

//   reSendOTP() {}
//   clearOTP() {
//     firstNumber = '';
//     secondeNumber = '';
//     thirdNumber = '';
//     fourthNumber = '';
//     fifthNumber = '';
//     sixthNumber = '';
//   }

//   nextButtonCheck() async {
//     if (checkOTPValues()) {
//       String code =
//           "$firstNumber$secondeNumber$thirdNumber$fourthNumber$fifthNumber$sixthNumber";
//       // statusRequest = StatusRequest.loading;
//       // update();
//       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       //     verificationId: userVerificationId, smsCode: code);
//       try {
//         // await FirebaseAuth.instance.signInWithCredential(credential);
//         // Get.offNamed(AppRoutes.emailCheckPageRoute);
//       } catch (e) {
//         // AppToasts.errorToast("الكود خاطئ!");
//         // clearOTP();
//       }
//       // statusRequest = StatusRequest.none;
//       update();
//     }
//     update();
//   }

//   void otpChanged(BuildContext context, String val, int index) {
//     switch (index) {
//       case 0:
//         firstNumber = val;
//         break;
//       case 1:
//         secondeNumber = val;
//         break;
//       case 2:
//         thirdNumber = val;
//         break;
//       case 3:
//         fourthNumber = val;
//         break;
//       case 4:
//         fifthNumber = val;
//         break;
//       default:
//         sixthNumber = val;
//     }
//     if (val.isEmpty && index != 0) {
//       FocusScope.of(context).requestFocus(focusList[index - 1]);
//     } else {
//       List<String> numbersList = [
//         firstNumber,
//         secondeNumber,
//         thirdNumber,
//         fourthNumber,
//         fifthNumber,
//         sixthNumber
//       ];
//       if (checkOTPValues()) {
//         FocusScope.of(context).unfocus();
//         nextButtonCheck();
//       } else {
//         for (int i = 0; i < numbersList.length; i++) {
//           if (numbersList[i].isEmpty) {
//             FocusScope.of(context).requestFocus(focusList[i]);
//             break;
//           }
//         }
//       }
//     }
//   }

//   @override
//   void onInit() {
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     signUpButtonGesture = TapGestureRecognizer()
//       ..onTap = () => Get.offNamed(AppRoutes.signUpPageRoute);
//     formsData = [
//       FormsDataModel(
//           hint: "البريد الإلكتروني", textEditingController: emailController),
//       FormsDataModel(
//           hint: "كلمة المرور",
//           isPassword: true,
//           textEditingController: passwordController),
//     ];
//     firstNode = FocusNode();
//     secondeNode = FocusNode();
//     thirdNode = FocusNode();
//     fourthNode = FocusNode();
//     fifthNode = FocusNode();
//     sixthNode = FocusNode();
//     focusList = [
//       firstNode,
//       secondeNode,
//       thirdNode,
//       fourthNode,
//       fifthNode,
//       sixthNode
//     ];
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     firstNode.dispose();
//     secondeNode.dispose();
//     thirdNode.dispose();
//     fourthNode.dispose();
//     fifthNode.dispose();
//     sixthNode.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     signUpButtonGesture.dispose();
//     super.dispose();
//   }
// }
