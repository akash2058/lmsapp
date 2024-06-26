import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lmsapp/providers/appproviders.dart';

import 'package:lmsapp/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
  WidgetsBinding.instance.addPostFrameCallback((timeStap) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      // ignore: prefer_const_constructors
      designSize: Size(428, 926),
      child: MultiProvider(
        providers: getProviders(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
