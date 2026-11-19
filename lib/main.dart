import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_shopping_cart/presentation/routing_manager.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import './presentation/app_data_provider.dart';
import 'data/mock_repository.dart';

void bootstrapApp() {
  AppDataProvider ap = AppDataProvider(repository: MockRepository());
  ShoppingCartProvider sp = ShoppingCartProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppDataProvider>(create: (_) => ap),
        ChangeNotifierProvider<ShoppingCartProvider>(create: (_) => sp),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => bootstrapApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutingManager.routingFunction,
      initialRoute: RoutingManager.homePage,
    );
  }
}
