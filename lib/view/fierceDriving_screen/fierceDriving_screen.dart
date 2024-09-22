import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../reuseable/header.dart';
import '../../utils/appColors.dart';
import '../main_screen/mainScreen_controller.dart';
import '../main_screen/main_screen.dart';
import 'fierceDriving_controller.dart';

class FierceDrivingScreen extends StatelessWidget {
  const FierceDrivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FierceDrivingController());
    return GetBuilder(
        init: controller,
        builder: (controller){
          return Scaffold(
            drawer: _drawer(context),
            backgroundColor: AppColors.BGIColor,
            body: SafeArea(
              child: Scrollbar(
                controller: controller.scrollController, // <---- Here, the controller
                thumbVisibility: true,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 10),
                  controller: controller.scrollController,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Header(title: 'Fierce Driving',date: true,),
                        SizedBox(height: 15,),
                       /// ----- code for screen -------------------------------
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  Widget _drawer(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return MainScreen().drawer(context, controller);
  }
}
