import 'dart:ui';

import 'package:driver_fatigue_system/utils/appAssets.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../dummyModelData/activity_model.dart';

class DummyData{

  final activityData = [
    ActivityModel(icon: AppAssets.carDash, title: '100k', value: 'Device Sale',color: Color(0xffFFF9F0)),
    ActivityModel(icon: AppAssets.totalClientDash, title: '50k', value: 'Device Sale',color: Color(0xffF1FAFF)),
    ActivityModel(icon: AppAssets.cashCurrencyDash, title: '10Cr', value: 'Total Earning',color: Color(0xffFFF3FC)),
    ActivityModel(icon: AppAssets.boxRemoveDash, title: '10', value: 'Cancelled device',color: Color(0xffFFF3F3)),

  ];

  final spots = const [
    FlSpot(7.81, 19.82),
    FlSpot(32.49, 46.54),
    FlSpot(43.12, 53.18),
    FlSpot(54.21, 78.95),
    FlSpot(94.68, 46.05),
    FlSpot(118.52, 57.60),
  ];

  final leftTitle = {
    0: '0',
    20: '100',
    40: '200',
    60: '300',
    80: '500',
    100: '1000'
  };

  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };

  Map<String, double> dataMap = {
    "Flutter": 8,
    "React": 2,
  };

  List<Color> colors = [AppColors.editColor ,AppColors.green];

  static List<Color> gradientColors = [
  AppColors.green,
  AppColors.white,

  ];

   final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

 static final List<Map<String, String>> bookingData = List.generate(52, (index) {
    return {
      'sNo': (index + 1).toString().padLeft(2, '0'),
      'bookingId': '#00${2589 + index}',
      'name': 'John Rahan ${index + 1}',
      'mobileNumber': '+91 98706543210',
      'dateTime': '19 Jan 2023 at 06:36 PM'
    };
  });

  var items = [
    'This Year',
    '2024',
    '2023',
    '2022',
    '2021',
  ];


}