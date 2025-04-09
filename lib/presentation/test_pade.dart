import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/app_data_provider.dart';
import 'package:my_shopping_cart/presentation/components/category_slider.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  final AppDataProvider provider;
  const TestPage({super.key, required this.provider});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
    _loadState = _loadAllData();
    super.initState();
  }

  Widget _waiting(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TestPage")),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Waiting to load data..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadState,
      builder: (BuildContext context, AsyncSnapshot<void> data) {
        if (data.connectionState == ConnectionState.done && data.hasData) {
          AppDataProvider provider = Provider.of(context);
          return Scaffold(
            appBar: AppBar(title: const Text("TestPage")),
            body: CategorySliderWidget(
                categories: provider.getCategories, listener: (_) {}),
          );
        } else {
          return _waiting(context);
        }
      },
    );
  }
}
