import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:lmsapp/firebase_api/firebase_api.dart';
import 'package:lmsapp/providers/appproviders.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().notification();
  runApp(const MyApp());
  // WidgetsBinding.instance.addPostFrameCallback((timeStap) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isinternetisconnected = false;
  StreamSubscription? _streamSubscription;
  @override
  void initState() {
    super.initState();
    _streamSubscription = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isinternetisconnected = true;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isinternetisconnected = false;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    'No Internet Connection !!!',
                    style: titlestyle,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Ok',
                          style: titleStyle,
                        ))
                  ],
                );
              },
            );
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(428, 926),
      child: MultiProvider(
        providers: getProviders(),
        child: MaterialApp(
          navigatorKey: navigatorkey,

          debugShowCheckedModeBanner: false,
          // ignore: unrelated_type_equality_checks
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
