import 'package:driver_fatigue_system/reuseable/customButton.dart';
import 'package:driver_fatigue_system/utils/reponsive.dart';
import 'package:driver_fatigue_system/view/customer/customer_billing/customer_billing_controller.dart';
import 'package:driver_fatigue_system/view/customer/customer_mainScreen/customer_mainScreen.dart';
import 'package:driver_fatigue_system/view/customer/customer_mainScreen/customer_mainScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reuseable/header.dart';
import '../../../utils/appAssets.dart';
import '../../../utils/appColors.dart';
class CustomerBillingScreen extends StatelessWidget {
  const CustomerBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerBillingController());
    return GetBuilder(
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
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Header(title: 'Billing',date: true,),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          Row(
                            children: [
                              // Current Plan Summary
                             Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.headerColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 10,),
                                              Text('Current Plan Summary',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                                            ],
                                          ),
                                          CustomButton( text: 'Upgrade', onPressed: () {  },)
                                        ],
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 16/6,
                                      child: Container(
                                        padding: EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          border: Border.all(color: Colors.grey[300]!),
                                        ),
                                        child:  Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            const Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('PLAN NAME', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                                                    SizedBox(height: 5),

                                                    Text('Growth Plan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text('BILLING CYCLE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                                                    SizedBox(height: 5),

                                                    Text('Monthly', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text('PLAN COST', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                                                    SizedBox(height: 5),
                                                    Text('5698', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                  ],
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            SizedBox(height: 10),
                                            Text('Usage'),

                                            Text('4850 out of 5k monthly active users'),

                                            Container(
                                              height: 10.0,  // Set the desired height here
                                              child: LinearProgressIndicator(
                                                value: 0.7,  // Example value for progress
                                                backgroundColor: Colors.grey[200],
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if(!Responsive.isMobile(context)) SizedBox(width: 16),
                              // Payment Method
                              if(!Responsive.isMobile(context))  Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.headerColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 10,),
                                          Text('Payment Method',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 16/6,
                                      child: Container(
                                        padding: EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          border: Border.all(color: Colors.grey[300]!),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey.shade200),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: const Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.credit_card, color: Colors.orange, size: 30),
                                                  SizedBox(width: 8),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Master Card '),
                                                      Text('**** **** **** 4002'),
                                                      Text('Expiry: 20/2024'),
                                                      Text('billing@acme.corp'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Responsive.isMobile(context) == true
                          ? SizedBox(
                        width: double.infinity,
                            child: Column(
                                                    children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.headerColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10,),
                                  Text('Payment Method',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16/6,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.shade200),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.credit_card, color: Colors.orange, size: 30),
                                          SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Master Card '),
                                              Text('**** **** **** 4002'),
                                              Text('Expiry: 20/2024'),
                                              Text('billing@acme.corp'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                                                    ],
                                                  ),
                          ):SizedBox(),
                      // Invoice Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Invoice', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                const Text('Effortlessly handle your billing and invoices right here.', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12)),

                              ],
                            ),
                            ElevatedButton(onPressed: () {}, child: Text('Download')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Invoice List
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.headerColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Row(
                             children: [
                               Text('Invoice ID'),
                               Icon(Icons.arrow_drop_down)
                             ],
                           ),
                            Row(
                              children: [
                                Text('Billing Date'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                            Row(
                              children: [
                                Text('Plan'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                            Row(
                              children: [
                                Text('Amount'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                            Row(
                              children: [
                                Text('Status'),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 10,
                            itemBuilder: (context,index){
                          return _buildInvoiceItem();
                        })
                      ),
                      const SizedBox(height: 10,)

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
  Widget _buildInvoiceItem() {
    return   Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('#23456'),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('23 Jan 2023'),
            ),
            Text('Basic Plan'),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text('1200'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.3),
                borderRadius: BorderRadius.circular(20)
              ),
              alignment: Alignment.center,
              height: 35,
                width: 50,

                child: Text('Paid',style: TextStyle(fontSize: 10),)),
          ],
        ),
      ),
    );
  }
  Widget _drawer(BuildContext context) {
    final controller = Get.put(CustomerMainScreenController());
    return CustomerMainScreen().drawer(context, controller);
  }
}
