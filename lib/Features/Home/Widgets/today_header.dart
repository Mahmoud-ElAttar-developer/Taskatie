import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskatie/Core/Utils/app_colors.dart';
import 'package:taskatie/Core/Utils/text_styles.dart';
import 'package:taskatie/Core/Widgets/custom_button.dart';

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
            Text(date, style: Theme.of(context).textTheme.displayMedium),
            Text('Today', style: getTitleStyle(fontSize: 20)),
          ],
        ),
        Spacer(),
        CustomButton(
          width: 151,
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
