import 'package:flutter/material.dart';

TextStyle getTitleStyle({
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.bold,
  Color color = const Color(0xFF4E5AE8),
}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getbodyStyle({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.black,
}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

TextStyle getSmallStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.grey,
}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}
