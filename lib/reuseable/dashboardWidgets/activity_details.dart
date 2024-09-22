
import 'package:driver_fatigue_system/reuseable/data/dummyData.dart';
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/reponsive.dart';

class ActivityDetails extends StatelessWidget {
  // Callback for item taps

  const ActivityDetails({super.key, });

  @override
  Widget build(BuildContext context) {
    final activityData = DummyData();
    return GridView.builder(
      shrinkWrap: true,
      padding:EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5
      ),
      itemCount: activityData.activityData.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: activityData.activityData[index].color

                ),
                child: Image.asset(
                  activityData.activityData[index].icon,
                  width: 30,
                  height: 30,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    activityData.activityData[index].title,
                    style:  TextStyle(
                      fontSize: 30,
                      color: AppColors.editColor,
                      fontWeight: FontWeight.w700,
                    ),

                  ),
                  Text(
                    activityData.activityData[index].value,
                    style:  TextStyle(
                      fontSize: 15,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
