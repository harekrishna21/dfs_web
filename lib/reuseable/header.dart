import 'package:driver_fatigue_system/utils/appAssets.dart';
import 'package:driver_fatigue_system/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../utils/reponsive.dart';

class Header extends StatelessWidget {
  final String? title;
  final bool? date;
  const Header({super.key,this.title,this.date=false});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.menu,
                    color: AppColors.titleColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isDesktop(context))SizedBox(width: 20,),
              Row(
                children: [
                  Text(title??'Dashboard',style: TextStyle(color: AppColors.titleColor,fontSize: 24,fontWeight: FontWeight.w600),),
                  SizedBox(width: 5,),
                  date!=true? Image.asset(AppAssets.helloIcon,height: 30,width: 30,):SizedBox()
                ],
              ),
              date!=true?Text('Today is Saturday, 14 Sep 24',
                style: TextStyle(color: AppColors.textColor,fontSize: 14,fontWeight: FontWeight.w400),):SizedBox(),
            ],
          ),
      Spacer(),
        Expanded(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search here...',
                suffixIcon:  Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Image.asset(AppAssets.notifyIcon,fit: BoxFit.cover,),
          ),
          SizedBox(width: 10,),
          Container(
            height: 40,
            width: 40,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Image.asset(AppAssets.profileImage,fit: BoxFit.fill,),
          ),
          SizedBox(width: 10,),
    ]);
  }
}
