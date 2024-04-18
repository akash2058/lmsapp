import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSmallButton extends StatelessWidget {
  Color? backgroudcolor;
  double? height;
  double? width;
  String text;
  Color? textcolor;
  List<Color>? colors;
  VoidCallback onTap;
  Color? bordercolor;
  CustomSmallButton(
      {super.key,
      required this.text,
      this.height,
      this.colors,
      this.textcolor,
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
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700, fontSize: 16.sp, color: textcolor),
        ),
      ),
    );
  }
}
