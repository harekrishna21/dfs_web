import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reuseable/customerDataTable/customerDataTable.dart';
import '../../reuseable/header.dart';
import '../../utils/appColors.dart';
import '../main_screen/mainScreen_controller.dart';
import '../main_screen/main_screen.dart';
import 'all_Device_controller.dart';

class AllDeviceScreen extends StatelessWidget {
  const AllDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllDeviceController());
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
                  child:  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Header(title: 'Devices List',date: true,),
                        SizedBox(height: 15,),
                        /// ----- code for screen -------------------------------
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
    return const MainScreen().drawer(context, controller);
  }

  Widget _buildBottomButton(String text) {
    return TextButton(
      onPressed: () {
        // Add action for each button here
      },
      child: Text(text),
    );
  }
}
