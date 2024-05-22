import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/bottom_sheet/provider/bottomsheetprovider.dart';
import 'package:lmsapp/views/drawer/drawer_screen/controller/drawercontroller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/cart/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => MenuProviders(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => AuthenticationProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => DrawerProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => BottomsheetProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => CartProvider(),
    ),
  ];
}
