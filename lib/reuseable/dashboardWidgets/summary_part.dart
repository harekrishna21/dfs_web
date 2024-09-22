

import 'package:driver_fatigue_system/reuseable/dashboardWidgets/pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/appAssets.dart';
import '../../utils/appColors.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          child: Row(
            children: [
              Image.asset(AppAssets.chartDash,height: 20,width: 20,),
              SizedBox(width: 10,),
              Text('Drivers Status',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
            color: Colors.white,
        ),
        child: const AspectRatio(
        aspectRatio: 16 / 6,
    child: Piechart(),
    ),)


      ],
    );
  }
}
