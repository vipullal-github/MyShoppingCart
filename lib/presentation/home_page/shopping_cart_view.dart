import 'package:flutter/material.dart';

import '../../domain/model/item_category.dart';
import '../app_data_provider.dart';

class ShoppingCartView extends StatelessWidget {
  final AppDataProvider provider;
  const ShoppingCartView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    List<ItemCategory> categories = provider.getCategories;
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(categories[index].name),
            subtitle: Text(categories[index].description),
            children: provider
                .getItemsForCategories(categories[index].id)
                .map((e) => Text(e.itemName))
                .toList(),
          );
        });
  }
}
