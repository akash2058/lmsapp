import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/drawer/drawer_screen/controller/drawercontroller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
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
    
  ];
}
