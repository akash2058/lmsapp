import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

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