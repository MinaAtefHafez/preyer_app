import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle get style30 => TextStyle(
      fontSize: 30.sp, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle get styleGo30 => GoogleFonts.poppins(
      fontSize: 30.sp, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle get styleGo25 => GoogleFonts.poppins(
      fontSize: 25.sp, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle get styleGo20 => GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle get styleGo18 => GoogleFonts.poppins(
      fontSize: 18.sp, fontWeight: FontWeight.w300, color: Colors.black);

  static TextStyle get style15 => GoogleFonts.poppins (
      fontSize : 15.sp , fontWeight: FontWeight.w300, color: Colors.black
  );    
}
