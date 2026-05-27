import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/7486744.png'),
          Gap(15),
          Text('No Task Added', style:Theme.of( context).textTheme.displayMedium,),
        ],
      ),
    );
  }
}
