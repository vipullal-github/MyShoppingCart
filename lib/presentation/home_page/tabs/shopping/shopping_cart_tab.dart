import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/components/shopping_item_card.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import '../../../../presentation/components/category_slider.dart';
import '../../../../domain/model/cart_item.dart';
import '../../../app_data_provider.dart';

class ShoppingCartTab extends StatefulWidget {
  const ShoppingCartTab({super.key});
  @override
  State<ShoppingCartTab> createState() => _ShoppingCartTabState();
}

// -------------------------------------------------------------
class _ShoppingCartTabState extends State<ShoppingCartTab> {
  int currrentCategoryId = 0;
  late Map<int, List<CartItem>> itemMap;

  @override
  void initState() {
    AppDataProvider p = context.read<AppDataProvider>();
    itemMap = p.categoryId2CartItemMap;
    assert(itemMap.isNotEmpty);
    currrentCategoryId = itemMap.keys.first;
    super.initState();
  }

  Widget _buildItemListForCurentCategory(BuildContext context) {
    List<CartItem>? items = itemMap[currrentCategoryId];
    if (items == null || items.isEmpty) {
      return const Center(
        child: Text("No Items in this category"),
      );
    } else {
      return ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (BuildContext context, int index) {
          return ShoppingItemCard(cartItem: items[index]);
        },
      );
    }
  }

  void onCategorySelectionChanged(int newId) {
    setState(() {
      currrentCategoryId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppDataProvider p = context.read<AppDataProvider>();
    context.watch<ShoppingCartProvider>();
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          CategorySliderWidget(
            categories: p.getCategories,
            listener: onCategorySelectionChanged,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: _buildItemListForCurentCategory(context),
          )
        ],
      ),
    );
  }
}
