import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 26.25.w, vertical: 20.h),
        elevation: 3,
        child: const MessageBox(),
      ),
      appBar: CustomAppbar(title: 'Shane Martinez'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 11.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReceiverCard(),
              SizedBox(
                height: 32.h,
              ),
              SenderCard(),
              SizedBox(
                height: 32.h,
              ),
              ReceiverCard(),
              SizedBox(
                height: 32.h,
              ),
              SenderCard(),
              SizedBox(
                height: 32.h,
              ),
              ReceiverCard(),
              SizedBox(
                height: 32.h,
              ),
              SenderCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class SenderCard extends StatelessWidget {
  const SenderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            width: 104.w,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r)),
                  color: AppColors.secondarybrown),
              child: Text(
                'Sure, that sounds good. I need to take a break from staring at my computer screen all day.',
                style: anotherormaltextStylewhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReceiverCard extends StatelessWidget {
  const ReceiverCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 36.h,
            width: 36.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppImages.imgone))),
          ),
          SizedBox(
            width: 9.w,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                      topRight: Radius.circular(10.r)),
                  color: AppColors.formfillcolor),
              child: Text(
                'Not too bad, just trying to catch up on some work. How about you?',
                style: anotherormaltextblackstyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.mic,
          color: AppColors.primarybrown,
        ),
        SizedBox(
          width: 11.w,
        ),
        const Icon(
          Icons.image,
          color: AppColors.primarybrown,
        ),
        SizedBox(
          width: 11.w,
        ),
        Expanded(
            child: CustomFormField(
          fillcolor: AppColors.primarywhite,
          hint: 'Write message',
          suffix: const Icon(Icons.emoji_emotions_outlined),
        )),
        SizedBox(
          width: 16.w,
        ),
        CircleAvatar(
            backgroundColor: AppColors.primarywhite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.send,
                size: 24.h,
                color: AppColors.primarybrown,
              ),
            ))
      ],
    );
  }
}
