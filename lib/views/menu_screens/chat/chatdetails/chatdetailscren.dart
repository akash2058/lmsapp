import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';

import 'package:lmsapp/utilities/appcolors.dart';

import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_screens/chat/provider/chat_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatDetailsScreen extends StatefulWidget {
  String title;
  String id;

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
    await state.getMessage(context, widget.id);
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
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.symmetric(horizontal: 26.25.w, vertical: 20.h),
            elevation: 3,
            child: MessageBox(
              id: widget.id,
              userId: auth.userid.toString(),
              onSend: _scrollToBottom, // Call _scrollToBottom on send
            ),
          ),
          appBar: CustomAppbar(
            title: widget.title,
            autoapply: true,
          ),
          body: get.loadingmessage == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 11.h),
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
                                height: 22.h,
                              ),
                            ],
                          );
                        }),
                  ),
                ));
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
  final String userId;
  final VoidCallback onSend;

  const MessageBox({
    super.key,
    required this.id,
    required this.userId,
    required this.onSend,
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
            onTap: () async {
              await Provider.of<ChatProvider>(context, listen: false)
                  .sendMessage(context, id, userId);
              onSend(); // Call the onSend callback
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
