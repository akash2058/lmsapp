import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_screens/chat/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String title;
  final String id;

  ChatDetailsScreen({super.key, required this.id, required this.title});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getmessagedata();
    });
  }

  Future<void> getmessagedata() async {
    var state = Provider.of<ChatProvider>(context, listen: false);
    var auth = Provider.of<AuthenticationProvider>(context, listen: false);
    await state.getMessage(context, widget.id, auth.userid);
    await auth.loadLoginData();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, get, child) {
      var auth = Provider.of<AuthenticationProvider>(context, listen: false);
      return Scaffold(
        appBar: CustomAppbar(
          title: widget.title,
          autoapply: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 11.h),
          child: get.loadingmessage == true
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: getmessagedata,
                        child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: get.message?.data?.chats?.length ?? 0,
                          itemBuilder: (context, index) {
                            var data = get.message?.data?.chats?[index];

                            return Column(
                              children: [
                                if (data?.receiverId.toString() ==
                                    auth.userid.toString())
                                  ReceiverCard(
                                    img:
                                        '${get.message?.data?.userProfileBaseUrl}/${data?.receiverPhoto}',
                                    message: data?.message ?? '',
                                  ),
                                if (data?.senderId.toString() ==
                                    auth.userid.toString())
                                  SenderCard(
                                    message: data?.message ?? '',
                                  ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    BottomMessageBar(
                      id: widget.id,
                      userId: auth.userid.toString(),
                      onSend: _scrollToBottom, // Call _scrollToBottom on send
                    ),
                  ],
                ),
        ),
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

class BottomMessageBar extends StatelessWidget {
  final String id;
  final String userId;
  final VoidCallback onSend;

  const BottomMessageBar({
    super.key,
    required this.id,
    required this.userId,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, get, child) {
      return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
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
                onTap: () async {
                  await Provider.of<ChatProvider>(context, listen: false)
                      .sendMessage(context, id, userId);
                  get.messagecontroller.clear();

                  onSend(); // Call the onSend callback
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.secondarybrown),
                  child: get.loadingsendingmessage == true
                      ? const CircularProgressIndicator(
                          color: AppColors.primarybrown,
                        )
                      : Icon(
                          Icons.send,
                          size: 24.h,
                          color: AppColors.primarywhite,
                        ),
                ))
          ],
        ),
      );
    });
  }
}
