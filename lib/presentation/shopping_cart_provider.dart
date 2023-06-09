
import 'package:flutter/material.dart';

import '../domain/model/cart_item.dart';
import 'app_data_provider.dart';

class ShoppingCartProvider with ChangeNotifier
{
  AppDataProvider _mProvider;
  List<CartItem> _mCartItems = [];

  ShoppingCartProvider( AppDataProvider provider ): _mProvider = provider;




}