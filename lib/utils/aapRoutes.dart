

import 'package:driver_fatigue_system/view/customerList_screen/addNewCustomer/addNewCustomer_screen.dart';
import 'package:driver_fatigue_system/view/customerList_screen/customerList_binding.dart';
import 'package:driver_fatigue_system/view/customerList_screen/customerList_screen.dart';
import 'package:driver_fatigue_system/view/dashbord_screen/dashboard_binding.dart';
import 'package:driver_fatigue_system/view/dashbord_screen/dashboard_screen.dart';
import 'package:driver_fatigue_system/view/login_screen/loginScreen_binding.dart';
import 'package:driver_fatigue_system/view/login_screen/login_screen.dart';
import 'package:driver_fatigue_system/view/main_screen/mainScreen_binding.dart';
import 'package:driver_fatigue_system/view/main_screen/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.mainScreen, page: () => const MainScreen(), binding: MainScreenBinding()),
    GetPage(name: AppRoutes.dashBoard, page: () => const DashboardScreen(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen(), binding: LoginScreenBinding()),
    GetPage(name: AppRoutes.customerScreen, page: () => const CustomerListScreen(), binding: CustomerListBinding()),
    GetPage(name: AppRoutes.addNewCustomer, page: () => const AddNewCustomerScreen(),),


  ];
}

class AppRoutes {
  static const mainScreen = '/mainScreen';
  static const dashBoard = '/dashBoard';
  static const loginScreen = '/loginScreen';
  static const customerScreen = '/customerScreen';
  static const addNewCustomer = '/addNewCustomer';

}
