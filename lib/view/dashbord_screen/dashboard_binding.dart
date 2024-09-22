import 'package:driver_fatigue_system/view/dashbord_screen/dashborad_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
  }

}