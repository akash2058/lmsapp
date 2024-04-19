import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomItemsPrice extends StatelessWidget {
  String items;
  String amount;
  CustomItemsPrice({super.key, required this.amount, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          items,
          style: itemsfont,
        ),
        Text(
          amount,
          style: otherfont,
        )
      ],
    );
  }
}
