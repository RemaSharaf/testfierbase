import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class colors {
  static const Color background = Color(0xff8B9A47);
  static const Color textField = Color(0xffD6E3E2);
  static const Color textColor = Color(0xffEEEEEE);
  static const Color textInputColor = Color(0xff3A3F47);
  static const Color button = Color(0xff936E4C);
  static const Color details = Color(0xffD65B32);

  // ignore: non_constant_identifier_names
  Text App_Text(
      {required String text,
      double size = 32,
      Color color = textColor,
      FontWeight fontWeight = FontWeight.w600,
      TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.clip,
      style: GoogleFonts.poppins(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: TextDecoration.none),
    );
  }
}
