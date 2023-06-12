import 'package:flutter/material.dart';
import 'package:my_shopping_cart/domain/model/shopping_list.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';

import '../../domain/model/cart_item.dart';
import '../../domain/model/item_category.dart';

class ShoppingCartView extends StatelessWidget {
  final ShoppingCartProvider provider;
  final Future<ShoppingList> _future;
  ShoppingCartView({super.key, required this.provider})
      : _future = provider.createNewShoppingList();

  List<Widget> _buildChildWidgets(BuildContext context, List<CartItem>? items) {
    if (items == null) {
      return [const Text("No Items")];
    } else {
      return items.map((e) {
        return Text(e.itemName);
      }).toList();
    }
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<ShoppingList> data) {
    if (data.hasData) {
      List<Widget> topView = [];
      Map<ItemCategory, List<CartItem>> itemMap = data.data!.items;
      for (ItemCategory c in itemMap.keys) {
        topView.add(
          ExpansionTile(
            title: Text(c.name),
            subtitle: Text(c.description),
            children: _buildChildWidgets(context, itemMap[c]),
          ),
        );
      }
      return SingleChildScrollView(
        child: Column(children: topView),
      );
    } else {
      return const Center(
        child: Text("Error while loading data"),
      );
    }
  }

  Widget _waitingForData(BuildContext context) {
    return const Center(
      child: Text("Waiting for data..."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<ShoppingList> data) {
          switch (data.connectionState) {
            case ConnectionState.none:
              return _waitingForData(context);
            case ConnectionState.waiting:
              return _waitingForData(context);
            case ConnectionState.active:
              return _waitingForData(context);
            case ConnectionState.done:
              return _buildBody(context, data);
          }
        });

    // List<ItemCategory> categories = provider.get
    // return ListView.builder(
    //     itemCount: categories.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ExpansionTile(
    //         title: Text(categories[index].name),
    //         subtitle: Text(categories[index].description),
    //         children: provider
    //             .getItemsForCategories(categories[index].id)
    //             .map((e) => Text(e.itemName))
    //             .toList(),
    //       );
    //     });
  }
}
