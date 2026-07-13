import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:taskatie/Core/Services/local_storage.dart';
import 'package:taskatie/Core/Utils/app_colors.dart';

void showNameDialog(BuildContext context, name) {
  var formKey = GlobalKey<FormState>();
  var textCon = TextEditingController(text: name);

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: textCon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Your Name mustn\'t be empty';
                    }
                    return null;
                  },
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Name',
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AppLocal.cachData(AppLocal.Name_key, textCon.text);
                      context.pop();
                      context.go('/profile');
                    }
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    child: Text(
                      'Update Your Name',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showImageDialog(BuildContext context, {onTapCamera, onTapGallery}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ), // RoundedRectangleBorder
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ), // BoxDecoration
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTapCamera,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ), // BoxDecoration
                  child: Text(
                    'Upload from Camera',
                    style: TextStyle(color: AppColors.whiteColor),
                  ), // Text
                ), // Container
              ), // GestureDetector
              Gap(10),
              GestureDetector(
                onTap: onTapGallery,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ), // BoxDecoration
                  child: Text(
                    'Upload from Gallery',
                    style: TextStyle(color: AppColors.whiteColor),
                  ), // Text
                ), // Container
              ), // GestureDetector
            ],
          ),
        ),
      );
    },
  );
}
