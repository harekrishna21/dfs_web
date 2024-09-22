import 'package:driver_fatigue_system/view/main_screen/mainScreen_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MainScreenController>(MainScreenController());
  }

}