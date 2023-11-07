// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/repository/repository_interface.dart';
import '../domain/model/product_category.dart';
import '../domain/model/product.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/order.dart';

class AppDataProvider with ChangeNotifier {
  String appTitle = "Shopping Lists";
  RepositoryInterface repository;

  AppDataProvider({required this.repository});

  List<ProductCategory> _mCategories = [];
  List<ProductCategory> get getCategories => _mCategories;

  List<Product> _mItemMasterList = [];
  List<Product> get getItemMasterList => _mItemMasterList;

  // used by ShoppingCart tab
  Map<int, List<CartItem>> _mCartItemMap = {};
  Map<int, List<CartItem>> get categoryId2CartItemMap => _mCartItemMap;

  List<CartItem> _mCartItems = [];
  List<CartItem> get cartItems => _mCartItems;

  List<Order> _mOrderHistory = [];
  List<Order> get orderHistory => _mOrderHistory;

  // -------------------------------------------
  Map<int, List<CartItem>> buildCategory2CartItemMap() {
    Map<int, List<CartItem>> map = {};
    for (ProductCategory c in _mCategories) {
      List<CartItem> items = getItemsForCategories(c.id);
      map[c.id] = items;
    }
    return map;
  }

  // -------------------------------------------
  void _doLoadData(Completer c) async {
    _mCategories = await repository.getAllCategories();
    _mItemMasterList = await repository.getAllItems();
    _mCartItemMap = buildCategory2CartItemMap();
    c.complete();
  }

  // -------------------------------------------
  Future<void> loadData() async {
    Completer<void> completer = Completer<void>();
    _doLoadData(completer);
    return completer.future;
  }

  // -------------------------------------------
  List<CartItem> getItemsForCategories(int selectCat) {
    List<CartItem> items = _mItemMasterList
        .where((e) => e.categoryId == selectCat)
        .map((e) => CartItem.fromMasterItem(e))
        .toList();
    return items;
  }

  // -------------------------------------------
  List<Product> buildFavouritesList() {
    List<Product> fav =
        _mItemMasterList.where((element) => element.isFavorite).toList();
    return fav;
  }

  // -------------------------------------------
  void setFavoriteFlagOnProduct(int id, bool isFavourite) {
    // TODO: propogate this to the repository
    try {
      Product p = _mItemMasterList.firstWhere((element) => element.id == id);
      p.isFavorite = isFavourite;
    } catch (e) {
      // silent fail !!!
    }
  }
}
