// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/home_page/order_history_view.dart';
import 'package:my_shopping_cart/presentation/home_page/shopping_cart_view.dart';

import '../app_data_provider.dart';

class HomePage extends StatefulWidget {
  final AppDataProvider provider;
  const HomePage({super.key, required this.provider});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSheet = 0;
  Future<void>? _loadState;

  @override
  void initState() {
    super.initState();
    _loadState = widget.provider.loadData();
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
      return ShoppingCartView(provider: widget.provider);
    } else {
      return const OrderHistoryView();
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
