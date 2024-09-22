
import 'package:driver_fatigue_system/reuseable/data/dummyData.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:driver_fatigue_system/view/dashbord_screen/dashborad_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/appAssets.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DummyData();
    String dropdownvalue = 'This Year';
    final controller = Get.put(DashBoardController());
    return GetBuilder(
      init: controller,
        builder: (controller){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Image.asset(AppAssets.chartDash,height: 20,width: 20,),
                      SizedBox(width: 10,),
                      Text('Sale This year',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButton(
                        style: TextStyle(fontSize: 12),
                        underline: SizedBox(),
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.circular(10),
                        alignment: Alignment.center,
                        icon: Icon(Icons.keyboard_arrow_down,size: 18,),
                        items: data.items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        value: dropdownvalue,
                        onChanged: ( newValue) {
                          dropdownvalue = newValue??'fff';
                          controller.update();

                        }, ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: LineChart(
                  LineChartData(
                    lineTouchData:  LineTouchData(
                      handleBuiltInTouches: true,
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 20,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.2),
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(

                          color: Colors.grey.withOpacity(0.2),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles:  AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles:  AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return data.bottomTitle[value.toInt()] != null
                                ? SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                  data.bottomTitle[value.toInt()].toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.textColor)),
                            )
                                : const SizedBox();
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return data.leftTitle[value.toInt()] != null
                                ? Text(data.leftTitle[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.textColor))
                                : const SizedBox();
                          },
                          showTitles: true,
                          interval: 1,
                          reservedSize: 40,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                      border: Border.all(color: const Color(0xff37434d)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.green,
                        dotData: FlDotData(show: false),
                        barWidth: 2,
                        preventCurveOverShooting: true,
                        isStrokeJoinRound: true,
                        spots: data.spots,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: DummyData.gradientColors
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                    minX: 0,
                    maxX: 120,
                    maxY: 105,
                    minY: -5,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }


}
