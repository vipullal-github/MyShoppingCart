import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/components/category_card.dart';
import '../app_data_provider.dart';
import '../../domain/model/item_category.dart';

class CategorySliderWidget extends StatefulWidget {
  final AppDataProvider provider;
  const CategorySliderWidget({super.key, required this.provider});

  @override
  State<CategorySliderWidget> createState() => _CategorySliderWidgetState();
}


class _CategorySliderWidgetState extends State<CategorySliderWidget> {
  late List<ItemCategory> categories;

  @override
  void initState() {
    super.initState();
    categories = widget.provider.getCategories;
    print("Found ${categories.length} items");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((e) {
              return CategoryCard(
                category: e,
                onPressed: () {},
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
