import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/providers/appproviders.dart';

import 'package:lmsapp/views/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      // ignore: prefer_const_constructors
      designSize: Size(428, 932),
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
