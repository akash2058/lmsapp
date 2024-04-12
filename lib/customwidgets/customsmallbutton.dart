import 'package:flutter/material.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class CustomSmallButton extends StatelessWidget {
  Color? backgroudcolor;
  double? height;
  double? width;
  String text;
  VoidCallback onTap;
  CustomSmallButton(
      {super.key,
      required this.text,
      this.height,
      this.width,
      this.backgroudcolor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroudcolor),
        onPressed: onTap,
        child: Text(
          text,
          style: buttonstyle,
        ),
      ),
    );
  }
}
