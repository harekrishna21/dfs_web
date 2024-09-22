import 'package:driver_fatigue_system/view/customerList_screen/customerList_controller.dart';
import 'package:get/get.dart';

class CustomerListBinding extends Bindings{
  @override
  void dependencies() {
   Get.put<CustomerListController>(CustomerListController());
  }

}