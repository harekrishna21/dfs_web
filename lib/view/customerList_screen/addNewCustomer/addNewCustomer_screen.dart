import 'package:driver_fatigue_system/reuseable/customButton.dart';
import 'package:driver_fatigue_system/reuseable/customTextField.dart';
import 'package:driver_fatigue_system/utils/reponsive.dart';
import 'package:driver_fatigue_system/view/customerList_screen/addNewCustomer/addNewCustomer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reuseable/header.dart';
import '../../../utils/appColors.dart';

class AddNewCustomerScreen extends StatelessWidget {
  const AddNewCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = AddNewCustomerController();
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
                    const Header(title: 'Add New Customer',date: true,),
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
                                    labelText: 'First Name',
                                    hintText: 'First Name',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Last Name',
                                    hintText: 'Last Name',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            const Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Email ID',
                                    hintText: 'Email ID',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: 'Email ID',
                                    hintText: 'Email ID',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                const Expanded(
                                  child: CustomTextField(
                                    labelText: 'Device ID',
                                    hintText: 'Device ID',
                                  ),
                                ),
                                SizedBox(width: 10),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Add Quantity:'),
                                          Row(
                                            children: [
                                              Container(
                                                color: Colors.grey.shade200,
                                                child: IconButton(
                                                  icon: Icon(Icons.remove),
                                                  onPressed: () {
                                                    if (controller.quantity.value > 0)
                                                      controller.quantity.value--;
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(controller.quantity.value.toString()),
                                              SizedBox(width: 5,),
                                              Container(
                                                color: Colors.grey.shade200,
                                                child: IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    controller.quantity.value++;
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 10,)

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            const CustomTextField(
                              labelText: 'Address',
                              hintText: 'Address',
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.cloud_upload, size: 40, color: Colors.blue),
                                    SizedBox(height: 5),
                                    const Text(
                                      'Drop Your File Here, or',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Browse',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    const Text(
                                      'Supports file, Excel, Word, PDF',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            CustomButton(text: 'Save Customer',
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
