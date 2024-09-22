
import 'package:driver_fatigue_system/utils/aapRoutes.dart';
import 'package:driver_fatigue_system/utils/sharePerf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



/*String deviceType = "";
String deviceId = '';
String deviceInfo = '';*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  await SharedPref.getInstance();
  /*SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);*/
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Driver Fatigue System',
            theme: ThemeData.light(),
            initialRoute: AppRoutes.loginScreen,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        }
    );
    }
}
