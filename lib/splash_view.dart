import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        // ضيف السطر ده عشان التأمين
        context.go('/upload'); // لازم تحط المسار بين علامات تنصيص كدة '/home'
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animation - 1704214319274.json',
                height: 250,
                width: 250,
              ),
              Gap(20),
              Text(
                '      Taskati',
                style: getTitleStyle(color: AppColors.primaryColor),
              ),
              Gap(20),
              Text('It\'s time to be oraganized', style: getSmallStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
