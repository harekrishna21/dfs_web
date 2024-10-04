import 'package:driver_fatigue_system/view/customerList_screen/addNewCustomer/addNewCustomer_screen.dart';
import 'package:driver_fatigue_system/view/dashbord_screen/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../apiEnvironment/connectivitycheck.dart';
import '../AllDevice_screen/addDevice/addDevice_screen.dart';
import '../AllDevice_screen/all_device_screen.dart';
import '../customerList_screen/customerList_screen.dart';
import '../earningReport_screen/earningReport_screen.dart';
import '../localization_screen/localization_screen.dart';
import '../manageDocuments_screen/manageDocuments_screen.dart';
import '../reviewRating_screen/reviewRating_screen.dart';
import '../vehicleType_screen/vehicleType_screen.dart';

class MainScreenController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxBool selectIndex = false.obs;

  ///-------- customer list var --------------
  int rowsPerPage = 10; // Number of rows per page
  int currentPage = 0; // T
  bool selectedPage = false;
  final scrollController = ScrollController();





  List<Widget> screensList = [
    const DashboardScreen(),
    const CustomerListScreen(),
    const AllDeviceScreen(),
    const LocalizationScreen(),
    const VehicleTypeScreen(),
    const ManageDocumentsScreen(),
    const ReviewRatingScreen(),
    Container(),
    const AddNewCustomerScreen(),
    const AddDeviceScreen(),
  ];


}