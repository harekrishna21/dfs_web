import 'package:driver_fatigue_system/utils/aapRoutes.dart';
import 'package:driver_fatigue_system/utils/appAssets.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:driver_fatigue_system/view/login_screen/loginScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/reponsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.BGIColor,
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) == true ? 50
                  : Responsive.isTablet(context) == true ?100:200,
              vertical: 50),
          child: Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        child: Image.asset(
                          AppAssets.loginImage,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                             Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: Image.asset(AppAssets.loginCarImage),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Driver Fatigue',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Hello',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  color: AppColors.editColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Enter your email and choose password to setup your account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             TextField(
                               onChanged: (val){
                                 val.isNotEmpty?controller.isIconVisible.value = true:controller.isIconVisible.value = false;
                                 controller.update();
                               },
                               controller: controller.userIDController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'User ID',
                                hintText: 'Enter user ID',
                                labelStyle: TextStyle(color: Colors.black87,fontSize: 15),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                suffixIcon: controller.isIconVisible.value ==true
                                    ?IconButton(onPressed: (){
                                      controller.userIDController.clear();
                                }, icon: Icon(Icons.clear,color: Colors.black87,))
                                    :SizedBox()
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: controller.passwordController,
                              obscureText: controller.passwordIconVisible.value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                labelStyle: TextStyle(color: Colors.black87,fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                  suffixIcon:
                                      IconButton(onPressed: (){
                                    controller.passwordIconVisible.value = !controller.passwordIconVisible.value;
                                    controller.update();
                                  }, icon: Icon(controller.passwordIconVisible.value == true
                                          ?Icons.visibility:Icons.visibility_off,color: Colors.black87,))
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(value: controller.rememberMe.value, onChanged: (val) {
                                      controller.rememberMe.value = !controller.rememberMe.value;
                                      controller.update();
                                    }),
                                    const Text(
                                      'Remember me',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.validation(context);
                                    controller.update();
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            AppColors.green),
                                  ),
                                  child: Text(
                                    'Login Your Account'.toUpperCase(),
                                    style: TextStyle(
                                      letterSpacing: 2,
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      );
      ;
    });
  }
}
