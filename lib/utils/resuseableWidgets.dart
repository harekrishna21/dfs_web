import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReuseableWidgets {
   static showErrorSnackBar({
    required BuildContext context,
    required String message,
    AnimatedSnackBarType type = AnimatedSnackBarType.error,
    Duration duration = const Duration(seconds: 3),
     desktopSnackBarPosition =  DesktopSnackBarPosition.bottomRight
  }) {
    AnimatedSnackBar.material(
      message,
      type: type,
      duration: duration,
        desktopSnackBarPosition:desktopSnackBarPosition
    ).show(context);
  }

  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    AnimatedSnackBarType type = AnimatedSnackBarType.success,
    Duration duration = const Duration(seconds: 3),
  }) {
    AnimatedSnackBar.material(
      message,
      type: type,
      duration: duration,
      desktopSnackBarPosition: DesktopSnackBarPosition.bottomRight
    ).show(context);
  }
}
