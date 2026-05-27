import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Services/local_storage.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:flutter_application_3/Core/Widgets/custom_button.dart';
import 'package:flutter_application_3/Core/Widgets/custom_snackbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

String? imagepath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              if (imagepath != null && name.isNotEmpty) {
                AppLocal.cachData('image', imagepath!);
                AppLocal.cachData('name', name);
                context.go('/home');
              } else if (imagepath == null && name.isNotEmpty) {
                showErrorText(context, 'Please select an image');
              } else if (imagepath != null && name.isEmpty) {
                showErrorText(context, 'Please enter a name');
              } else {
                showErrorText(
                  context,
                  'Please enter a name and select an image and try again',
                );
              }
            },
            child: Text('Done', style:Theme.of( context).textTheme.displaySmall),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        (imagepath != null) // اتأكد إن الـ p سمول زي تعريفك
                        ? FileImage(File(imagepath!)) as ImageProvider
                        : const AssetImage('assets/abstract-user-flat-4.png'),
                  ),
                  if (imagepath != null)
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            imagepath = null;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              Gap(20),
              CustomButton(
                width: 250,
                text: 'Upload from camera',style: getbodyStyle(color: AppColors.whiteColor),
                onPressed: () {
                  uploadFromCamera();
                },
              ),
              Gap(10),
              CustomButton(
               
                text: 'Upload from gallery',style: getbodyStyle(color: AppColors.whiteColor),
                onPressed: () {
                  uploadFromGallery();
                },
              ),
              Gap(15),
              Divider(
                endIndent: 20,
                indent: 20,
                color: AppColors.blackColor,
                thickness: 1.2,
              ),
              Gap(15),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(hintText: 'Enter your name',
                hintStyle:Theme.of( context).textTheme.displaySmall),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadFromCamera() async {
    final imagePicked = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imagePicked != null) {
      AppLocal.cachData(AppLocal.Image_key, imagePicked.path);
      setState(() {
        imagepath = imagePicked.path;
      });
    }
  }

  Future<void> uploadFromGallery() async {
    final imagePicked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicked != null) {
      AppLocal.cachData(AppLocal.Image_key, imagePicked.path);
      setState(() {
        imagepath = imagePicked.path;
      });
    }
  }
}
