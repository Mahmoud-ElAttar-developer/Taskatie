import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:flutter_application_3/Core/Widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: getbodyStyle(fontSize: 20)),
            Text('Today', style: getTitleStyle(fontSize: 20)),
          ],
        ),
        Spacer(),
        CustomButton(
          width: 148,
          style: getbodyStyle(color: AppColors.whiteColor),
          text: '+ Add Task',
          onPressed: () {
            context.push('/add-task');
          },
        ),
      ],
    );
  }
}
