import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/chat/provider/chat_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatDetailsScreen extends StatefulWidget {
  String id;

  ChatDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getmessagedata();
  }

  Future<void> getmessagedata() async {
    var state = Provider.of<ChatProvider>(context, listen: false);
    await state.getMessage(widget.id, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, get, child) {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 26.25.w, vertical: 20.h),
          elevation: 3,
          child: const MessageBox(),
        ),
        appBar: CustomAppbar(
          title: 'Shane Martinez',
          autoapply: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 11.h),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Column(
                  children: List.generate(5, (index) {
                    return Column(
                      children: [
                        const ReceiverCard(),
                        SizedBox(
                          height: 32.h,
                        ),
                        const SenderCard(),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.primarylowlightdark)),
            child: CustomFormField(
              fillcolor: AppColors.primarywhite,
              hint: 'Write message',
            ),
          ),
        ),
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
