import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proj/local/modules/account/model/enums/account_image_state.dart';

class AccountController extends GetxController {
  String? accountImage;
  String? accountBackImage;
  AccountImageState accountImageState = AccountImageState.none;
  AccountImageState accountBackImageState = AccountImageState.none;
  String userName = "Magd";
  pickAccountImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      accountImage = image.path;
      accountImageState = AccountImageState.image;
    }
    update();
  }

  pickAccountBackImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      accountBackImage = image.path;
      accountBackImageState = AccountImageState.image;
    }
    update();
  }
}
