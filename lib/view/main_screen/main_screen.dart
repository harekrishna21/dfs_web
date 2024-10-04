import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:driver_fatigue_system/utils/reponsive.dart';
import 'package:driver_fatigue_system/utils/resuseableWidgets.dart';
import 'package:driver_fatigue_system/view/main_screen/mainScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appAssets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.BGIColor,
        drawer: drawer(context,controller),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)) drawer(context,controller),
              Expanded(
                flex: 8,
                child: SizedBox(
                  child: controller.selectedIndex.value >= 0 &&
                      controller.selectedIndex.value < controller.screensList.length
                      ? controller.screensList[controller.selectedIndex.value]
                      : Container()// Fallback if index is invalid
                ),
              ),

            ],
          ),
        ),
      );
    });
  }

  Widget drawer(BuildContext context, MainScreenController controller) {
    return SizedBox(
      height: double.infinity,
      width: 250,
      child: Drawer(
        backgroundColor: Colors.white,
        elevation: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset(AppAssets.loginCarImage),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Driver Fatigue',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                listTile(
                    AppAssets.dashboardImage,
                    'DashBoard', () {
                  controller.selectedIndex.value = 0;  // Update index to 0 for Dashboard
                  controller.update();
                },
                    controller,
                    controller.selectedIndex.value == 0 ? true : false
                ),

                listTile(
                    AppAssets.clientImage,
                    'All Clients', () {
                  controller.selectedIndex.value = 1;
                  controller.update();
                }, controller,(controller.selectedIndex.value == 1||controller.selectedIndex.value == 8)?true:false),
                listTile(
                    AppAssets.tagUserImage,
                    'All Device', () {
                  controller.selectedIndex.value = 2;
                  controller.update();
                }, controller,(controller.selectedIndex.value == 2||controller.selectedIndex.value == 9)?true:false),
                listTile(
                    AppAssets.mapImage,
                    'Payment', () {
                  controller.selectedIndex.value = 3;
                  controller.update();
                }, controller,controller.selectedIndex.value == 3?true:false),
                listTile(
                    AppAssets.truckImage,
                    'Vehicle Type', () {
                  controller.selectedIndex.value = 4;
                  controller.update();
                }, controller,controller.selectedIndex.value == 4?true:false),

                listTile(
                    AppAssets.documentImage,
                    'Manage Documents', () {
                  controller.selectedIndex.value = 5;
                  controller.update();
                }, controller,controller.selectedIndex.value == 5?true:false),
                listTile(
                    AppAssets.ratingImage,
                    'Review & Rating', () {
                  controller.selectedIndex.value = 6;
                  controller.update();
                }, controller,controller.selectedIndex.value == 6?true:false),
                listTile(
                    AppAssets.logoutImage,
                    'Log Out', () {
                  controller.selectedIndex.value = 7;
                  controller.update();
                }, controller,controller.selectedIndex.value == 7?true:false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile(String? image, String? text, void Function()? onTap,
      MainScreenController controller, bool selected) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      leading:
          Image.asset(
            color: selected == true? AppColors.white:AppColors.textColor,
           image?? AppAssets.dashboardImage,
            height: 20,
            width: 20,
          ),
      title: Text(
        text ?? 'DashBoard',
        style: TextStyle(
            color:selected == true? AppColors.white:AppColors.textColor,
            fontSize: 15,
            fontWeight: FontWeight.w400),
      ),
      selectedTileColor: AppColors.green,
      selected: selected,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      //hoverColor: AppColors.green,

      // tileColor: Colors.green,
    );
  }
}
