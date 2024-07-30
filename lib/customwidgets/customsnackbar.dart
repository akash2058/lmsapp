import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(content: Text('Hello')),
    );
  }
}
