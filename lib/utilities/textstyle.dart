import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmsapp/utilities/appcolors.dart';

// TextStyle get titleStyle {
//   return const TextStyle(
//     fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: "Poppins" );
// }

TextStyle get normaltextStyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.primarygrey);
}

TextStyle get anotherormaltextStyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.primarygrey);
}

TextStyle get othernormaltextStyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      color: AppColors.primarygrey);
}

TextStyle get fonts {
  return GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.primarylowlightdark);
}

TextStyle get titlestyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: AppColors.primaryblack);
}

TextStyle get authenticationtitlestyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w800,
      fontSize: 32.sp,
      color: AppColors.primaryblack);
}

TextStyle get otherstyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: AppColors.primaryblack);
}

TextStyle get buttonstyle {
  return GoogleFonts.manrope(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: AppColors.primarywhite);
}

TextStyle get formfieldstyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.primaryblack);
}

TextStyle get otherfont {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: AppColors.primaryblack);
}

TextStyle get interfont {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: AppColors.primaryblack);
}

TextStyle get getfonts {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: AppColors.primarygrey);
}
