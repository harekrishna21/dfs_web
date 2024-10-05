import 'package:driver_fatigue_system/view/customer/customer_device_screen/customer_device_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reuseable/header.dart';
import '../../../utils/appColors.dart';
import '../customer_mainScreen/customer_mainScreen.dart';
import '../customer_mainScreen/customer_mainScreen_controller.dart';

class CustomerDeviceScreen extends StatelessWidget {
  const CustomerDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerDeviceController());
    return GetBuilder(
      init: controller,
        builder: (controller){
      return  Scaffold(
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
                child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Header(title: 'Device',date: true,),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 500,
                          width: 500,
                          child: HtmlElementView(viewType: 'mapDiv')),
                      SizedBox(height: 10,)

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
