import 'package:Taskatie/Core/Utils/app_colors.dart';
import 'package:Taskatie/Core/Utils/text_styles.dart';
import 'package:flutter/material.dart';

void showErrorText(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: getbodyStyle(color: AppColors.whiteColor)),
      backgroundColor: AppColors.greyColor,
    ),
  );
}
