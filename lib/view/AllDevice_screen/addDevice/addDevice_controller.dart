import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/appColors.dart';


class AddDeviceController extends GetxController{
  final scrollController = ScrollController();
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      /*helpText: 'Please Selected Purchases Date',
      confirmText: 'CONFIRM', // Text for the confirm button
      cancelText: 'CANCEL', // Text for the cancel button
      fieldHintText: 'Month/Day/Year', // Hint text for the input field
      fieldLabelText: 'Enter Date',*/
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime.now(), // earliest date
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogTheme: DialogTheme(
              actionsPadding: EdgeInsets.zero,
              titleTextStyle: TextStyle(color: Colors.white),
              contentTextStyle: TextStyle(color: Colors.white),
              insetPadding: EdgeInsets.zero,
              backgroundColor: AppColors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Customize radius here
              ),
            ),
          ),
          child: child!,
        );
      },// latest date
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd-MMM-yyyy').format(picked);
      dateController.text = formattedDate; // set the selected date to TextField

    }
  }

}