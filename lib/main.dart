import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/routing_manager.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import './presentation/app_data_provider.dart';
import 'data/mock_repository.dart';

void main() {
  AppDataProvider ap = AppDataProvider(repository: MockRepository());
  ShoppingCartProvider sp = ShoppingCartProvider(mProvider: ap);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppDataProvider>(create: (_) => ap),
        ChangeNotifierProvider<ShoppingCartProvider>(create: (context) => sp),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutingManager.routingFunction,
      initialRoute: RoutingManager.testPage,
    );
  }
}
