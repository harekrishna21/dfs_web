import 'package:driver_fatigue_system/reuseable/data/dummyData.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class Piechart extends StatelessWidget {
  const Piechart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DummyData();
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 180,
          child: PieChart(
            dataMap: data.dataMap,
            animationDuration: Duration(milliseconds: 700),
            colorList: data.colors,
            initialAngleInDegree: 50,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
            centerWidget:  Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.editColor,width: 2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Active', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),),
                  Text('100.00%(51)', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                      fontSize: 12
                  ),)
                ],
              ),
            ),
            //gradientList: data.gradientList,
            emptyColorGradient: [
              Color(0xff6c5ce7),
              Colors.blue,
            ],
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: false,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: true,
              decimalPlaces: 1,
            ),

          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Active Devices : ',style: TextStyle(color:AppColors.textColor,fontSize: 24,fontWeight: FontWeight.w500),),
                Text('51',style: TextStyle(color: AppColors.textColor,fontSize: 24,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text('Today : ',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
                Text('04',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('This Month : ',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
                Text('20',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('This year : ',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
                Text('50',style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),),
              ],
            )
          ],
        )

      ],
    );
  }
}
