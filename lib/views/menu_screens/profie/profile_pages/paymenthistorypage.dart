import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';

import 'package:lmsapp/views/menu_screens/profie/components/paymenthistorypagecard.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/paymentcourselandingpage.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColors.primarywhite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomButton(
                width: MediaQuery.sizeOf(context).width,
                height: 53.h,
                text: 'Back to Homepage',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: CustomAppbar(autoapply: true, title: 'Payment History'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
            children: List.generate(
                3,
                (index) => Column(
                      children: [
                        PaymentHistoryCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: PaymentCourseLandingPage()));
                          },
                          coursetitle: 'UI/UX Development',
                          date: '23,MARCH 2023',
                          price: 'INR 4800',
                          time: '10:59 PM',
                          img: AppImages.imgone,
                        ),
                        SizedBox(
                          height: 24.h,
                        )
                      ],
                    ))),
      ),
    );
  }
}
