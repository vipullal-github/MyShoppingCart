import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/shopping_list.dart';

class ShoppingCartProvider with ChangeNotifier {
  ShoppingList? _shoppingList;

  ShoppingCartProvider();

  void _doCreateNewShoppingList(Completer<ShoppingList> c) async {
    ShoppingList newList = ShoppingList.newRecord(
        name: "Shopping List",
        created: DateTime.now(),
        modified: DateTime.now());
    c.complete(newList);
  }

  Future<ShoppingList> createNewShoppingList() {
    Completer<ShoppingList> c = Completer();
    _doCreateNewShoppingList(c);
    return c.future;
  }

  void addCartItem(CartItem item) {
    // TODO: This should be a useCase
    assert(_shoppingList != null);
    assert(item.onOrder > 0);
    assert(item.usualPrice >= 0.0);
    for (var element in _shoppingList!.itemList) {
      if (element.id == item.id) {
        element.onOrder += item.onOrder;
        return;
      }
    }
    // Item does not exist: Add it
    _shoppingList!.itemList.add(item);
  }
}
