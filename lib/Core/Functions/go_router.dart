import 'package:Taskatie/Features/Add-Task/add_task_view.dart';
import 'package:Taskatie/Features/Home/home_view.dart';
import 'package:Taskatie/Features/Profile/profile.dart';
import 'package:Taskatie/Features/Upload/upload.dart';
import 'package:Taskatie/splash_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: '/upload',
      builder: (context, state) => const UploadView(), // الصفحة اللي هتروح لها
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(), // الصفحة اللي هتروح لها
    ),
    GoRoute(
      path: '/add-task',
      builder: (context, state) => const AddTaskView(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => const ProfileView()),
  ],
);
