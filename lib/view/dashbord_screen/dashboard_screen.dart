import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:driver_fatigue_system/view/dashbord_screen/dashborad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reuseable/dashboardWidgets/activity_details.dart';
import '../../reuseable/recentCustomerList/dataTable.dart';
import '../../reuseable/header.dart';
import '../../reuseable/dashboardWidgets/line_cart_card.dart';
import '../../reuseable/dashboardWidgets/summary_part.dart';
import '../../utils/reponsive.dart';
import '../main_screen/mainScreen_controller.dart';
import '../main_screen/main_screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Header(),
                      const SizedBox(height: 15),
                      const ActivityDetails(), // Pass callback here
                      const SizedBox(height: 15),
                      if (!Responsive.isMobile(context))const Row(
                        children: [
                          Expanded(child: LineChartCard()),
                          SizedBox(width: 15,),
                          Expanded(child: SummaryWidget()),
                        ],
                      ),
                      if (Responsive.isMobile(context)) LineChartCard(),
                      if (Responsive.isMobile(context)) SizedBox(height: 15,),
                      if (Responsive.isMobile(context))SummaryWidget(),
                      SizedBox(height: 15,),
                      DashboardTable(),
                      const SizedBox(height: 20),
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
    final controller = Get.put(MainScreenController());
    return MainScreen().drawer(context, controller);
  }
}
