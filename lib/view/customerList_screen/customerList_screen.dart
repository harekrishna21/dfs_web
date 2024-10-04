
import 'package:driver_fatigue_system/view/customerList_screen/customerList_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reuseable/customerDataTable/customerDataTable.dart';
import '../../reuseable/header.dart';
import '../../utils/appColors.dart';
import '../main_screen/mainScreen_controller.dart';
import '../main_screen/main_screen.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerListController());
    return GetBuilder(
      init: controller,
        builder: (controller){
      return Scaffold(
        drawer: _drawer(context),
        backgroundColor: AppColors.BGIColor,
        body: SafeArea(
          child: Scrollbar(
            controller: controller.scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(right: 10),
              controller: controller.scrollController,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Header(title: 'Customer List',date: true,),
                    SizedBox(height: 15,),
                    DashBoardDataTable(),
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
