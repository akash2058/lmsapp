import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:provider/provider.dart';

class ReferalPage extends StatelessWidget {
  const ReferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataform = GlobalKey<FormState>();
    return Consumer<MenuProviders>(
      builder: (context, menu, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'Referral System'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: Form(
              key: dataform,
              child: Column(
                children: [
                  CustomFormField(
                      validation: validateEmail,
                      controller: menu.emailcontroller,
                      hint: 'Enter Your Email'),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomButton(
                      height: 53.h,
                      text: menu.loadingreferalcode
                          ? 'Sending...'
                          : 'Send Coupone Code',
                      onTap: () {
                        if (dataform.currentState!.validate()) {
                          menu.getreferalcode(context);
                        }
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
