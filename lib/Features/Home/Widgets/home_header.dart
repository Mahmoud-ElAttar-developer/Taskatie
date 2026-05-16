import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Services/local_storage.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:gap/gap.dart';

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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Holla, ',
                    style: getTitleStyle(color: AppColors.blackColor),
                  ),

                  TextSpan(text: name, style: getTitleStyle()),
                ],
              ),
            ),
            Gap(5),
            Text('Have a nice day', style: getbodyStyle()),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundImage: (imagepath != null)
              ? FileImage(File(imagepath!)) as ImageProvider
              : const AssetImage('assets/abstract-user-flat-4.png'),
        ),
      ],
    );
  }
}
