import 'package:driver_fatigue_system/view/login_screen/loginScreen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.put<LoginScreenController>(LoginScreenController());
  }

}