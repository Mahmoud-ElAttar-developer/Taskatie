import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Core/Services/local_storage.dart';
import 'package:flutter_application_3/Core/Utils/app_colors.dart';
import 'package:flutter_application_3/Core/Utils/text_styles.dart';
import 'package:flutter_application_3/Features/Profile/show_dialoge.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

String? imagepath;
String name = '';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Box<bool> modeBox;
  @override
  void initState() {
    super.initState();
    modeBox = Hive.box('mode');
    AppLocal.getCachedData(AppLocal.Name_key).then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = modeBox.get('isDark') ?? false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.0,
        // surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                modeBox.put('isDark', isDark = !isDark);
              });
            },
            icon: isDark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
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
                    radius: 60,
                    backgroundColor: AppColors.whiteColor,

                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: imagepath != null && imagepath!.isNotEmpty
        ? FileImage(File(imagepath!))
        : const AssetImage('assets/default_avatar.png') as ImageProvider,
                      ),
                    ),
                    
                  ),

                  GestureDetector(
                    onTap: () {
                      showImageDialog(
                        context,
                        onTapCamera: () async {
                          await uploadFromCamera().then((value) {
                            if (!mounted) return; // حل تحذير الـ async gaps
                            setState(() {});
                            Navigator.of(context).pop();
                          });
                        },
                        onTapGallery: () async {
                          await uploadFromGallery().then((value) {
                            if (!mounted) return; // حل تحذير الـ async gaps
                            setState(() {});
                            Navigator.of(context).pop();
                          });
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(20),
              // CustomButton(
              //   width: 250,
              //   text: 'Upload from camera',style: getbodyStyle(color: AppColors.whiteColor),
              //   onPressed: () {
              //     uploadFromCamera();
              //   },
              // ),
              // Gap(10),
              // CustomButton(

              //   text: 'Upload from gallery',style: getbodyStyle(color: AppColors.whiteColor),
              //   onPressed: () {
              //     uploadFromGallery();
              //   },
              // ),
              // Gap(15),
              Divider(
                endIndent: 20,
                indent: 20,
                color: Theme.of(context).textTheme.displaySmall!.color,
                thickness: 1.2,
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: getbodyStyle(color: AppColors.primaryColor),
                  ), // Text
                  IconButton(
                    onPressed: () {
                      showNameDialog(context, name);
                      setState(() {});
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ), // BoxDecoration
                      child: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.primaryColor,
                      ), // Icon
                    ), // Container
                  ), // IconButton
                ],
              ),
         // Row
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
      setState(() {
        imagepath = imagePicked.path;
      });
    }
  }
}
