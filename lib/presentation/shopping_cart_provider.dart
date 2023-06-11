import 'package:flutter/material.dart';
import 'app_data_provider.dart';

class ShoppingCartProvider with ChangeNotifier {
  final AppDataProvider mProvider;

  ShoppingCartProvider({required this.mProvider});
}
