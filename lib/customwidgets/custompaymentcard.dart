import 'package:flutter/cupertino.dart';
import 'package:lmsapp/utilities/textstyle.dart';

// ignore: must_be_immutable
class CustomPaymentCard extends StatelessWidget {
  String amount;
  CustomPaymentCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Payment',    
          style: reviewfont,
        ),
        Text(
          amount,
          style: onboardtitle,
        ),
      ],
    );
  }
}
