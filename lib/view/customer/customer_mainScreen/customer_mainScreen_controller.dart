import 'package:driver_fatigue_system/view/customer/customer_billing/customer_billing_screen.dart';
import 'package:driver_fatigue_system/view/customer/customer_dashboard/customer_dashboard_screen.dart';
import 'package:driver_fatigue_system/view/customer/customer_device_screen/customer_device_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerMainScreenController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxBool selectIndex = false.obs;

  ///-------- customer list var --------------
  int rowsPerPage = 10; // Number of rows per page
  int currentPage = 0; // T
  bool selectedPage = false;
  final scrollController = ScrollController();





  List<Widget> screensList = [
    const CustomerDashboardScreen(),
    const CustomerDeviceScreen(),
     Container(),
    const CustomerBillingScreen(),
    Container(),
    Container(),
  ];
}