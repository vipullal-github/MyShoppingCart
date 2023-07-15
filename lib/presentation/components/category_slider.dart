import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/components/category_card.dart';
import '../../domain/model/item_category.dart';

typedef CategoryClickListener = void Function(int categoryId);

// TODO: We need to change this widget to use ListView.builder. See Video by HeyFlutter on Youtube
class CategorySliderWidget extends StatelessWidget {
  final List<ItemCategory> categories;
  final CategoryClickListener listener;
  const CategorySliderWidget(
      {super.key, required this.categories, required this.listener});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((e) {
          return CategoryCard(
            category: e,
            onPressed: () => listener(e.id),
          );
        }).toList(),
      ),
    );
  }
}
