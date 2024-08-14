import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/modules/carsdetails/model/car_images_model.dart';

class SavedImagesController extends GetxController {
  late Box<CarImagesModel> savedCarImagesBox;
  List<CarImagesModel> cars = [];
  StatusRequest statusRequest = StatusRequest.loading;
  @override
  void onReady() async {
    savedCarImagesBox = await Hive.openBox(HiveBoxes.savedCarsBox);
    cars = savedCarImagesBox.values.toList();
    statusRequest = StatusRequest.none;
    update();
    super.onReady();
  }

  @override
  void dispose() {
    savedCarImagesBox.close();
    super.dispose();
  }
}
