import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Message',
          style: pricefont,
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24.h,
          ),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 34.h),
        child: Column(
            children: List.generate(
          3,
          (index) => Column(
            children: [
              ChatCard(
                name: 'Shane Martinez',
                message:
                    'Have you spoken to the delivery man? He is more than an hour late',
                img: AppImages.imgone,
                time: '5 min',
                messageindication: '3',
              ),
              Divider(
                thickness: 1.h,
                color: AppColors.bordercolor,
              )
            ],
          ),
        )),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  String img;
  String name;
  String message;
  String time;
  String messageindication;
  ChatCard(
      {super.key,
      required this.name,
      required this.message,
      required this.time,
      required this.messageindication,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(),
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
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                time,
                style: itemsfont,
              ),
              SizedBox(
                height: 8.h,
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
    );
  }
}

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
                image:
                    DecorationImage(fit: BoxFit.cover, image: AssetImage(img)),
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
