import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/drawer/drawer_screen/controller/drawercontroller.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formdata = GlobalKey<FormState>();
    return Consumer<DrawerProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Form(
                key: formdata,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s Talk",
                      style: authenticationtitlestyle,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Enter the email associated with your account and we’ll send an email with code to reset your password.',
                      style: aboutustyle,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'First Name',
                      style: reviewtitlestyle,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomFormField(
                        controller: value.namecontroller,
                        validation: validatename,
                        hint: 'Enter Your Name'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Email',
                      style: reviewtitlestyle,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomFormField(
                        controller: value.emailcontroller,
                        validation: validateEmail,
                        hint: 'Enter your email address'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Title',
                      style: reviewtitlestyle,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomFormField(
                        validation: validatetitle,
                        controller: value.titlecontroller,
                        hint: 'Enter your title'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Description',
                      style: reviewtitlestyle,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomFormField(
                        controller: value.descriptioncontroller,
                        validation: validatedescription,
                        maxlines: 3,
                        hint: 'Write Down Here'),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                        height: 53.h,
                        text: value.loadinghelp == true
                            ? 'Please Wait ...'
                            : 'Submit',
                        onTap: () {
                          if (formdata.currentState!.validate()) {
                            value.getHelp(context);
                            value.namecontroller.clear();
                            value.emailcontroller.clear();
                            value.titlecontroller.clear();
                            value.descriptioncontroller.clear();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
