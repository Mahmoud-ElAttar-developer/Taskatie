import 'package:go_router/go_router.dart';
import 'package:taskatie/Features/Add-Task/add_task_view.dart';
import 'package:taskatie/Features/Home/home_view.dart';
import 'package:taskatie/Features/Profile/profile.dart';
import 'package:taskatie/Features/Upload/upload.dart';
import 'package:taskatie/splash_view.dart';

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
