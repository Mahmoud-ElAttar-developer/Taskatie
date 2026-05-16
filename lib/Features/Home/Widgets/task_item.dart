import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Model/task_model.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:gap/gap.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: getTitleStyle(
                  color: AppColors.whiteColor,
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.whiteColor,
                  ),
                  Gap(10),
                  Text(
                    '${task.startTime} : ${task.endTime}',
                    style: getSmallStyle(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Text(
                task.description,
                style: getbodyStyle(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: AppColors.whiteColor,
            width: .8,
            height: 90,
          ),
          Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.isCompleted ? 'COMLETED' : 'TODO',
              style: getbodyStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
