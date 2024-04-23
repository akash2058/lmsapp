import 'package:flutter/material.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  List<Widget>? actions;
  String title;
  bool autoapply;
  CustomAppbar(
      {super.key, required this.autoapply, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: autoapply,
      centerTitle: true,
      actions: actions,
      title: Text(
        title,
        style: appbartitlestyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
