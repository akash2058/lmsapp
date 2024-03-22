import 'package:lmsapp/views/menucard/main_menu_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => MenuProviders(),
    ),
    // ChangeNotifierProvider(
    //   lazy: false,
    //   create: (context) => CartState(),
    // ),
    // ChangeNotifierProvider(
    //   lazy: false,
    //   create: (context) => CheckoutState(),
    // ),
  ];
}
