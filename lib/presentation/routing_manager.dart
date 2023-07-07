import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/app_data_provider.dart';
import 'package:my_shopping_cart/presentation/test_pade.dart';
import 'package:provider/provider.dart';
import 'home_page/home_page.dart';
import 'master_list/master_list_page.dart';

class RoutingManager {
  static const String homePage = "/";
  static const String masterListPage = "/masteListPage";
  static const String testPage = "/testPage";

  static Route<dynamic> routingFunction(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (BuildContext context) {
          AppDataProvider p = context.watch<AppDataProvider>();
          return HomePage(provider: p);
        });
      case masterListPage:
        return MaterialPageRoute(builder: (_) => const MasterListPage());
      case testPage:
        return MaterialPageRoute(builder: (BuildContext context) {
          AppDataProvider p = context.read<AppDataProvider>();
          return TestPage(provider: p);
        });
      default:
        throw Exception("Invalid route ${settings.name}");
    }
  }
}
