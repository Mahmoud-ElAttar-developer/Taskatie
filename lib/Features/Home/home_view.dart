

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Model/task_model.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
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
              // Dtae Time Line-------------
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 70,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
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
                      tasks.add(element);
                    }

                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskItemWidget(task: tasks[index]);
                      },
                    );
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

  