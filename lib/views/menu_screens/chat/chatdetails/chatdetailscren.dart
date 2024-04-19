import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 26.25.w, vertical: 20.h),
        elevation: 3,
        child: MessageBox(),
      ),
      appBar: CustomAppbar(title: 'Shane Martinez'),
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
        Icon(
          Icons.mic,
          color: AppColors.primarybrown,
        ),
        SizedBox(
          width: 11.w,
        ),
        Icon(
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
          suffix: Icon(Icons.emoji_emotions_outlined),
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
