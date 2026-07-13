import 'package:flutter/material.dart';
import 'package:taskatie/Core/Utils/app_colors.dart';
import 'package:taskatie/Core/Utils/text_styles.dart';

void showErrorText(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: getbodyStyle(color: AppColors.whiteColor)),
      backgroundColor: AppColors.greyColor,
    ),
  );
}
