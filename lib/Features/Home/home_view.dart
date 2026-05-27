import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Model/task_model.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:flutter_application_3/Features/Home/Widgets/empty_task.dart';
import 'package:flutter_application_3/Features/Home/Widgets/home_header.dart';
import 'package:flutter_application_3/Features/Home/Widgets/task_item.dart';
import 'package:flutter_application_3/Features/Home/Widgets/today_header.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _selectedDate = DateTime.now().toIso8601String();
  @override
  Widget build(BuildContext context) {
    String date = DateFormat.yMMMEd().format(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              HomeHeader(),
              Gap(20),
              TodayHeaderWidget(date: date),
              Gap(20),
              // Date Time Line-------------
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 70,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                dateTextStyle: Theme.of(context).textTheme.displayLarge!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // // New date selected
                  setState(() {
                    _selectedDate = date.toIso8601String();
                  });
                },
              ),
              // Tasks List-------------
              Gap(20),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: Hive.box<TaskModel>('task').listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> tasks = [];
                    for (var element in box.values) {
                      if (_selectedDate.split('T').first ==
                          element.date.split('T').first) {
                        tasks.add(element);
                      }
                    }
                    if (tasks.isEmpty) {
                      return const EmptyTask(); // تأكد من استدعاء الويدجت الفاضي بتاعك هنا
                    } else {
                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                box.put(
                                  tasks[index].id,
                                  TaskModel(
                                    id: tasks[index].id,
                                    title: tasks[index].title,
                                    description: tasks[index].description,
                                    date: tasks[index].date,
                                    startTime: tasks[index].startTime,
                                    endTime: tasks[index].endTime,
                                    color: 3,
                                    isCompleted: true,
                                  ),
                                );
                              } else {
                                box.delete(tasks[index].id);
                              }
                            },
                            key: UniqueKey(),
                            background: Container(
                              color: AppColors.redColor,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        ' Delete',
                                        style: getbodyStyle(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: AppColors.greenColor,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        ' Completed',
                                        style: getbodyStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            child: TaskItemWidget(task: tasks[index]),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
