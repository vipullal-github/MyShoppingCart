import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/item_category.dart';
import '../domain/model/master_list_item.dart';
import '../domain/model/shopping_list.dart';
import 'app_data_provider.dart';

class ShoppingCartProvider with ChangeNotifier {
  final AppDataProvider mProvider;

  ShoppingCartProvider({required this.mProvider});

  void _doCreateNewShoppingList(Completer<ShoppingList> c) async {
    ShoppingList newList = ShoppingList.newRecord(
        name: "Shopping List",
        created: DateTime.now(),
        modified: DateTime.now());
    List<MasterListItem> allItems = mProvider.getItemMasterList;
    List<ItemCategory> categories = mProvider.getCategories;
    for (ItemCategory category in categories) {
      List<CartItem> items =
          allItems.where((item) => item.categoryId == category.id).map((e) {
        return CartItem.fromMasterItem(e);
      }).toList();
      newList.items[category] = items;
    }
    c.complete(newList);
  }

  Future<ShoppingList> createNewShoppingList() {
    Completer<ShoppingList> c = Completer();
    _doCreateNewShoppingList(c);
    return c.future;
  }
}
