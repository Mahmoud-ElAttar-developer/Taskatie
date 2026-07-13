import 'package:flutter/material.dart';
import 'package:taskatie/Core/Utils/app_colors.dart';
import 'package:taskatie/Core/Utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 250,
    this.style,
  });

  final String text;
  final double width;
  // لو الاستايل دا كان ب نل ما استخدمتوش ينادى الميثود بتاعت جت ستايل بص تحت لو استخدمته هيغطى اللى انا عملته
  final TextStyle? style;
  // المتغيرين دول التغييرات اللى على الزرار جبت المتغير التانى انى وقفت على انونيمس ميثود تحت و عرفته
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: style ?? getbodyStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

// First Extract widget
