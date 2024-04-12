import 'package:flutter/material.dart';
import 'package:lmsapp/views/menu_screens/cart/chatscreen.dart';
import 'package:lmsapp/views/menu_screens/chat/chatscreen.dart';
import 'package:lmsapp/views/menu_screens/home/homescreen.dart';
import 'package:lmsapp/views/menu_screens/profie/profilescreen.dart';

class MenuProviders extends ChangeNotifier {
  int currenttab = 0;

  List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
