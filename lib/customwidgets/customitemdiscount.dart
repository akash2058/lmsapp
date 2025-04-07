 // ignore_for_file: file_names

 import 'package:flutter/cupertino.dart';
 import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomItemDiscount extends StatelessWidget {
  String discount;
  String discountpercent;
  CustomItemDiscount(
      {super.key, required this.discount, required this.discountpercent});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          discount,
          style: itemsfont,
        ),
        Text(
          discountpercent,
          style: otherfont,
        )
      ],
    );
  }
}
