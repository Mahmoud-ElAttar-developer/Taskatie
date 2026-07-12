import 'package:Taskatie/Core/Functions/go_router.dart';
import 'package:Taskatie/Core/Model/task_model.dart';
import 'package:Taskatie/Core/Utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox<bool>('mode');
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('mode').listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        bool isDark = value.get('isDark', defaultValue: false);
        return MaterialApp.router(
          darkTheme: darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
