import 'package:driver_fatigue_system/view/customer/customer_dashboard/customer_dashboard_controller.dart';
import 'package:driver_fatigue_system/view/customer/customer_mainScreen/customer_mainScreen.dart';
import 'package:driver_fatigue_system/view/customer/customer_mainScreen/customer_mainScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reuseable/header.dart';
import '../../../utils/appColors.dart';

class CustomerDashboardScreen extends StatelessWidget {
  const CustomerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerDashboardController());
    return GetBuilder(
      init: controller,
        builder: (controller){
      return Scaffold(
        drawer: _drawer(context),
        backgroundColor: AppColors.BGIColor,
        body: SafeArea(
          child: Container(
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
                      Header(),
                      SizedBox(height: 15),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
  Widget _drawer(BuildContext context) {
    final controller = Get.put(CustomerMainScreenController());
    return CustomerMainScreen().drawer(context, controller);
  }
}
