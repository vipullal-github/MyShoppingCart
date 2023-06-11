// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/repository/repository_interface.dart';
import '../domain/model/item_category.dart';
import '../domain/model/master_list_item.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/order.dart';

class AppDataProvider with ChangeNotifier {
  String appTitle = "Shopping Lists";
  RepositoryInterface repository;

  AppDataProvider({required this.repository});

  List<ItemCategory> _mCategories = [];
  List<ItemCategory> get getCategories => _mCategories;

  List<MasterListItem> _mItemMasterList = [];
  List<MasterListItem> get getItemMasterList => _mItemMasterList;

  List<CartItem> _mCartItems = [];
  List<CartItem> get cartItems => _mCartItems;

  List<Order> _mOrderHistory = [];
  List<Order> get orderHistory => _mOrderHistory;

  void _doLoadData(Completer c) async {
    _mCategories = await repository.getAllCategories();
    _mItemMasterList = await repository.getAllItems();
    c.complete();
  }

  Future<void> loadData() async {
    Completer<void> completer = Completer<void>();
    _doLoadData(completer);
    return completer.future;
  }

  List<CartItem> getItemsForCategories(int selectCat) {
    List<CartItem> items = _mItemMasterList
        .where((e) => e.categoryId == selectCat)
        .map((e) => CartItem.fromMasterItem(e))
        .toList();
    return items;
  }
}
