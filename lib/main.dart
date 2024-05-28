import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/providers/appproviders.dart';

import 'package:lmsapp/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async {
  await PersistentShoppingCart().init();
  runApp(const MyApp());
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
