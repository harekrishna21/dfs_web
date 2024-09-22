import 'package:driver_fatigue_system/view/localization_screen/localization_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../reuseable/header.dart';
import '../../utils/appColors.dart';
import '../main_screen/mainScreen_controller.dart';
import '../main_screen/main_screen.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocalizationController());
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
                        Header(title: 'Localization',date: true,),
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
