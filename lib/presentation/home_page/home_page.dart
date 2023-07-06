// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/home_page/tabs/order_history/order_history_tab.dart';
import 'package:my_shopping_cart/presentation/home_page/tabs/shopping/shopping_cart_tab.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

import '../app_data_provider.dart';

class HomePage extends StatefulWidget {
  final AppDataProvider provider;
  const HomePage({super.key, required this.provider});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSheet = 0;
  late Future<void> _loadState;

  Future<void> _loadAllData() async {
    Completer<void> c = Completer();
    widget.provider.loadData().then((value) {
      context
          .read<ShoppingCartProvider>()
          .createNewShoppingList()
          .then((value) => c.complete());
    });
    return c.future;
  }

  @override
  void initState() {
    super.initState();
    _loadState = _loadAllData();
  }

  void onTabSelected(int index) {
    if (index != currentSheet) {
      setState(
        () {
          currentSheet = index;
        },
      );
    }
  }

  Widget _buildWidgets(BuildContext context) {
    if (currentSheet == 0) {
      ShoppingCartProvider p = context.watch<ShoppingCartProvider>();
      return ShoppingCartTab(provider: p);
    } else {
      return const OrderHistoryTab();
    }
  }

  Widget _loadingData(BuildContext contetx) {
    return const Center(
      child: Text("Please wait, loading data"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: _loadState,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        print("Builder called with state ${snapshot.connectionState}");
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return _loadingData(context);
          case ConnectionState.waiting:
            return _loadingData(context);
          case ConnectionState.active:
            return _loadingData(context);
          case ConnectionState.done:
            return _buildWidgets(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentSheet,
          onTap: (value) => onTabSelected(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ]),
      body: _buildBody(context),
    );
  }
}
