import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_screens/chat/chatdetails/chatdetailscren.dart';
import 'package:lmsapp/views/menu_screens/chat/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getchatdata();
    });
  }

  Future<void> getchatdata() async {
    var state = Provider.of<ChatProvider>(context, listen: false);
    state.getChatRoom(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chat, child) {
        return Scaffold(
          appBar: CustomAppbar(
            title: 'Message',
            actions: [
              Icon(
                Icons.more_horiz,
                size: 24.h,
              ),
              SizedBox(
                width: 21.w,
              )
            ],
            autoapply: false,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 34.h),
            child: Column(
                children: List.generate(chat.chat?.data?.chatRoom?.length ?? 0,
                    (index) {
              var data = chat.chat?.data?.chatRoom?[index];
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ChatCard(
                    ontap: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(
                              child: ChatDetailsScreen(
                            id: data?.chatId.toString() ?? '',
                          )));
                    },
                    name: data?.user1Name ?? '',
                    message:
                        '${data?.user2Name ?? ''} : ${data?.lastMessage ?? ''}',
                    img:
                        '${chat.chat?.data?.userProfileBaseUrl}/${data?.otherUserPhoto ?? ''}',
                    time: data?.lastMessageTime ?? '',
                    messageindication:
                        chat.message?.data?.chats?.length.toString() ?? '',
                  ),
                  Divider(
                    thickness: 1.h,
                    color: AppColors.bordercolor,
                  )
                ],
              );
            })),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ChatCard extends StatelessWidget {
  String img;
  String name;
  String message;
  String time;
  String messageindication;
  VoidCallback? ontap;
  ChatCard(
      {super.key,
      required this.name,
      this.ontap,
      required this.message,
      required this.time,
      required this.messageindication,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatUserPicCard(img: img),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: titlestyle,
                  ),
                  Text(
                    message,
                    style: itemsfont,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: itemsfont,
                      ),
                      Container(
                        height: 32.h,
                        width: 31.w,
                        decoration: BoxDecoration(
                            color: AppColors.primarybrown,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: Text(
                            messageindication,
                            style: messageindicationstyle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Column(
            //   children: [
            //     Text(
            //       time,
            //       style: itemsfont,
            //     ),
            //     SizedBox(
            //       height: 8.h,
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatUserPicCard extends StatelessWidget {
  String img;
  ChatUserPicCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h,
      width: 68.w,
      child: Stack(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(img)),
                shape: BoxShape.circle),
          ),
          Icon(
            Icons.circle,
            color: AppColors.primarygreen,
            size: 16.h,
          ),
        ],
      ),
    );
  }
}
