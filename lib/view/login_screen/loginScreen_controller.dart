import 'package:driver_fatigue_system/utils/aapRoutes.dart';
import 'package:driver_fatigue_system/utils/resuseableWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController{
 RxBool passwordIconVisible = true.obs;
 RxBool isIconVisible = false.obs;
 RxBool rememberMe = false.obs;

 TextEditingController userIDController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 validation(BuildContext context){
  if(userIDController.text.isEmpty){
   ReuseableWidgets.showErrorSnackBar(context: context,message: 'Please Enter User ID');
  }else if(passwordController.text.isEmpty){
   ReuseableWidgets.showErrorSnackBar(context: context,message: 'Please Enter Password');
  }else{
   ReuseableWidgets.showSuccessSnackBar(context: context,message: 'Login Successfully');
   Get.offAllNamed(AppRoutes.mainScreen);
  }
 }

}