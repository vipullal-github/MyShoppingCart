import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/shopping_list.dart';
import 'app_data_provider.dart';

class ShoppingCartProvider with ChangeNotifier {
  ShoppingList? _shoppingList;

  final List<CartItem> _favouritesList = [];
  List<CartItem> get favouritesList => _favouritesList;

  int get itemCount => _shoppingList?.itemList.length ?? 0;
  double _total = 0.0;
  double get totalAmount => _total;

  ShoppingCartProvider();

  void _doCreateNewShoppingList(Completer<ShoppingList> c) async {
    ShoppingList newList = ShoppingList.newRecord(
        name: "Shopping List",
        created: DateTime.now(),
        modified: DateTime.now());
    _shoppingList = newList;
    c.complete(newList);
  }

  Future<ShoppingList> createNewShoppingList() {
    Completer<ShoppingList> c = Completer();
    _doCreateNewShoppingList(c);
    return c.future;
  }

  List<CartItem> getCartItems() => _shoppingList!.itemList;

  void _recalcTotal() {
    double total = 0.0;
    for (var element in _shoppingList!.itemList) {
      total += element.onOrder * element.usualPrice;
    }
    _total = total;
  }

  void updateCart(CartItem item) {
    // TODO: This should be a useCase
    assert(_shoppingList != null);
    assert(item.onOrder >= 0);
    assert(item.usualPrice >= 0.0);
    bool found = false;
    for (var element in _shoppingList!.itemList) {
      if (element.id == item.id) {
        element.onOrder = item.onOrder;
        found = true;
        if (item.onOrder == 0) {
          _shoppingList!.itemList.remove(element);
        }
        break;
      }
    }
    if (!found) {
      // Item does not exist: Add it
      _shoppingList!.itemList.add(item);
    }
    _recalcTotal();
    notifyListeners();
  }

  // ------------------------------------------------------------
  void buildFavoritesList(Map<int, List<CartItem>> itemMap) {
    _favouritesList.clear();
    itemMap.forEach((int catId, List<CartItem> items) {
      for (CartItem ci in items) {
        if (ci.isFavorite) {
          _favouritesList.add(ci);
        }
      }
    });
  }

  // NB: There are two sources of truth here. The flag is in the
  // CartItem which was copied from MasterItemList. The flag
  // has to be updated in both places.
  void onFavoriteIconTapped(CartItem item, AppDataProvider p) {
    if (item.isFavorite) {
      item.isFavorite = false;
      _favouritesList.remove(item);
      p.setFavoriteFlagOnProduct(item.id, false);
    } else {
      item.isFavorite = true;
      _favouritesList.add(item);
      p.setFavoriteFlagOnProduct(item.id, true);
    }
    notifyListeners();
  }
}
