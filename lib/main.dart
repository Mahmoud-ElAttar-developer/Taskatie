import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Functions/go_router.dart';
import 'package:flutter_application_3/Core/Model/task_model.dart';
import 'package:flutter_application_3/Core/Utils/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox<bool>('mode');
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
          themeMode:isDark ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
