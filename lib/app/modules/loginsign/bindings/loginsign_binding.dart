import 'package:flutter_application_kelas_d/app/modules/loginsign/controllers/loginsign_controller.dart';
import 'package:get/get.dart';

class LoginsignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginsignController>(() => LoginsignController());
  }
}
