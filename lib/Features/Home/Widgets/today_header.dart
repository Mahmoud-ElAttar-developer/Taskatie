import 'package:Taskatie/Core/Utils/app_colors.dart';
import 'package:Taskatie/Core/Utils/text_styles.dart';
import 'package:Taskatie/Core/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
