import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lmsapp/providers/appproviders.dart';
import 'package:lmsapp/views/nointernet_screen/noconection.dart';
import 'dart:developer' as developer;
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ConnectivityResult> connectionStatus = [
    ConnectivityResult.none,
  ];
  final Connectivity connectivity = Connectivity();
  @override
  void initState() {
    super.initState();
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;

    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      connectionStatus = result;
    });
    // ignore: avoid_print
    print('Connectivity changed: $connectionStatus');
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
          debugShowCheckedModeBanner: false,
          // ignore: unrelated_type_equality_checks
          home: connectionStatus == ConnectivityResult.none
              ? const NoInternetScreen()
              : const SplashScreen(),
        ),
      ),
    );
  }
}
