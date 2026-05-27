import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle({
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.w800,
  Color color =  Colors.white,
  
}) {
  return GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getbodyStyle({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.white,
}) {
  return GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getSmallStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w300,
  Color color = Colors.white,
}) {
  return GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color);
}
