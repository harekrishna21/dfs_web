import 'package:driver_fatigue_system/view/AllDevice_screen/addDevice/addDevice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../reuseable/customButton.dart';
import '../../../reuseable/customTextField.dart';
import '../../../reuseable/header.dart';
import '../../../utils/appColors.dart';
class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddDeviceController());
    return GetBuilder(
        init: controller,
        builder: (controller){
          return Scaffold(
            backgroundColor: AppColors.BGIColor,
            body: SafeArea(
              child: Scrollbar(
                controller: controller.scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 10),
                  controller: controller.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        const Header(title: 'Add New Device',date: true,),
                        const SizedBox(height: 15),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        labelText: 'Device ID',
                                        hintText: 'Device ID',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CustomTextField(
                                        labelText: 'Company Name',
                                        hintText: 'Company Name',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                 Row(
                                  children: [
                                    const Expanded(
                                      child: CustomTextField(
                                        labelText: 'Order ID',
                                        hintText: 'Order ID',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: CustomTextField(
                                        onTap:()=> controller.selectDate(context),
                                        readOnly: true,
                                        controller: controller.dateController,
                                        labelText: 'Purchase Date',
                                        hintText: 'Purchase Date',
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 24),
                                CustomButton(text: 'Add Device',
                                  onPressed: (){
                                  },color: AppColors.green,
                                  width: 200,
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
