import 'package:flutter/material.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap, // If enabled is false, onTap is null
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.primarybrown,
                    AppColors.secondarybrown,
                    AppColors.primaryacent
                  ],
                )
                // Set gradient to null if button is disabled
                ),
            child: Center(
              child: Text(
                text,
                style: buttonstyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
