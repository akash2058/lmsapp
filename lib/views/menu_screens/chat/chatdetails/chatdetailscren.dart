import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
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
    await state.getMessage(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, get, child) {
      var auth = Provider.of<AuthenticationProvider>(context, listen: false);
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 26.25.w, vertical: 20.h),
          elevation: 3,
          child: MessageBox(
            id: widget.id,
          ),
        ),
        appBar: CustomAppbar(
          title: 'Shane Martinez',
          autoapply: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 11.h),
            child: RefreshIndicator(
              onRefresh: getmessagedata,
              child: ListView(
                children: List.generate(get.message?.data?.chats?.length ?? 0,
                    (index) {
                  var data = get.message?.data?.chats?[index];
                  return Column(
                    children: [
                      if (data?.receiverId == auth.user?.data?.id)
                        ReceiverCard(
                          img:
                              '${get.message?.data?.userProfileBaseUrl}/${data?.receiverPhoto}',
                          message: data?.message ?? '',
                        ),

                      // ignore: unrelated_type_equality_checks
                      if (data?.senderId == auth.user?.data?.id)
                        SenderCard(
                          message: data?.message ?? '',
                        ),
                      SizedBox(
                        height: 22.h,
                      ),
                    ],
                  );
                }),
              ),
            )),
      );
    });
  }
}

class SenderCard extends StatelessWidget {
  final String message;
  const SenderCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                message,
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
  final String message;
  final String img;
  const ReceiverCard({super.key, required this.message, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(img))),
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
                message,
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
  final String id;
  const MessageBox({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, get, child) {
      return Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.primarylowlightdark)),
              child: CustomFormField(
                controller: get.messagecontroller,
                fillcolor: AppColors.primarywhite,
                hint: 'Write message',
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          GestureDetector(
            onTap: () {
              get.sendMessage(context, id);
            },
            child: CircleAvatar(
                backgroundColor: AppColors.primarywhite,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: get.loadingsendingmessage == true
                      ? const CircularProgressIndicator(
                          color: AppColors.primarybrown,
                        )
                      : Icon(
                          Icons.send,
                          size: 24.h,
                          color: AppColors.primarybrown,
                        ),
                )),
          )
        ],
      );
    });
  }
}
