import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Services/local_storage.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? imagepath;
  String? name;

  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData('image').then((value) {
      setState(() {
        imagepath = value;
      });
    });
    AppLocal.getCachedData('name').then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: AppLocal.getCachedData(AppLocal.Name_key),
              builder: (context, snapshot) {
                return Text(
                  'Holla, ${snapshot.data?.split('').first} ',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            Gap(10),
            Text(
              'Como te sientes hoy ?',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            await context.push('/profile');
          },
          child: FutureBuilder(
            future: AppLocal.getCachedData(AppLocal.Image_key),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: (snapshot.data != null)
                        ? FileImage(File(snapshot.data!)) as ImageProvider
                        : const AssetImage('assets/abstract-user-flat-4.png'),
                  ),
                );
              } else {
                return CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.greyColor,
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      'assets/abstract-user-flat-4.png',
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
