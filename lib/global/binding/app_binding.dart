import 'package:get/get.dart';
import '../core/api/dio_crud.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // to injection the crud class from the start of the application work
    Get.put(DioCrud());
  }
}
