import 'package:Taskatie/Core/Model/task_model.dart';
import 'package:Taskatie/Core/Utils/app_colors.dart';
import 'package:Taskatie/Core/Utils/text_styles.dart';
import 'package:Taskatie/Core/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var startTime = DateFormat('hh:mm a').format(DateTime.now());
  var endTime = DateFormat(
    'hh:mm a',
  ).format(DateTime.now().add(Duration(minutes: 15)));

  int colorIndex = 0;

  // خاص بجزء ال Hive----------------------------

  late Box<TaskModel> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('task');
    box.clear();
  }

  // -------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: Theme.of(context).textTheme.displayMedium),
              Gap(9),
              TextFormField(
                controller: titleController,
                style: Theme.of(context).textTheme.displayMedium,
                decoration: InputDecoration(hintText: 'Enter title here'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Gap(15),
              Text(
                'Description',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Gap(9),
              TextFormField(
                controller: descriptionController,
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 4,
                decoration: InputDecoration(hintText: 'Enter description here'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Gap(15),
              Text('Date', style: Theme.of(context).textTheme.displayMedium),
              Gap(9),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: date,
                  hintStyle: Theme.of(context).textTheme.displayMedium,
                  suffixIcon: IconButton(
                    onPressed: () {
                      getTaskDate();
                    },
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Gap(15),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Gap(9),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: startTime,
                            hintStyle: Theme.of(
                              context,
                            ).textTheme.displayMedium,
                            suffixIcon: IconButton(
                              onPressed: () {
                                getTaskStartTime();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Gap(9),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: endTime,
                            hintStyle: Theme.of(
                              context,
                            ).textTheme.displayMedium,
                            suffixIcon: IconButton(
                              onPressed: () {
                                getTaskEndTime();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 0;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.primaryColor,
                          child: colorIndex == 0
                              ? Icon(Icons.check, color: AppColors.whiteColor)
                              : null,
                        ),
                      ),
                      Gap(7),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 1;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.orangeColor,
                          child: colorIndex == 1
                              ? Icon(Icons.check, color: AppColors.whiteColor)
                              : null,
                        ),
                      ),

                      Gap(7),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            colorIndex = 2;
                          });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.redColor,
                          child: colorIndex == 2
                              ? Icon(Icons.check, color: AppColors.whiteColor)
                              : null,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  CustomButton(
                    width: 158,
                    style: getbodyStyle(color: AppColors.whiteColor),
                    text: 'Create Task',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        String id =
                            '${titleController.text}$startTime${DateTime.now().millisecond}';
                        await box.put(
                          id,
                          TaskModel(
                            id: id,
                            title: titleController.text,
                            description: descriptionController.text,
                            date: date,
                            startTime: startTime,
                            endTime: endTime,
                            color: colorIndex,
                            isCompleted: false,
                          ),
                        );
                        context.go('/home');
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTaskDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        setState(() {
          date = DateFormat('yyyy-MM-dd').format(value);
        });
      }
    });
  }

  void getTaskStartTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      if (value != null) {
        setState(() {
          startTime = value.format(context);
          endTime = value.replacing(minute: value.minute + 15).format(context);
        });
      }
    });
  }

  void getTaskEndTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      if (value != null) {
        setState(() {
          endTime = value.format(context);
        });
      }
    });
  }
}
