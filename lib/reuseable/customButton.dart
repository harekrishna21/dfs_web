import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final IconData? icons;
  final double? iconsSize;
  final double? width;

  // Constructor for the CustomButton widget
  CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // Default color if not provided
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 8.0, // Default border radius
    this.elevation = 2.0, // Default elevation
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    this.icons,
    this.iconsSize,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: Row(
          children: [
            Icon(icons??Icons.add,size:iconsSize ,color: textColor,),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}