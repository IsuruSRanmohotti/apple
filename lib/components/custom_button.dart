import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.size,
      required this.text,
      this.bgColor,
      this.borderColor,
      this.fontColor = Colors.white,required this.onTap});

  final Size size;
  final String text;
  final Color? bgColor;
  final Color? borderColor;
  final Color fontColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 55,
        decoration: BoxDecoration(
            color: bgColor ?? CustomColors.primaryColor,
            border: Border.all(
                color:
                    borderColor == null ? CustomColors.primaryColor : borderColor!,
                width: 1),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: fontColor, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}