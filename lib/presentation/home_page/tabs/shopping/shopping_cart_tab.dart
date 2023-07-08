import 'package:flutter/material.dart';
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

  Widget _buildItemCard(BuildContext context, CartItem item) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.itemName, style: Theme.of(context).textTheme.bodyLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  item.onOrder.toString(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    List<CartItem>? items = itemMap[currrentCategoryId];
    if (items == null) {
      return const Text("No Items");
    } else {
      return SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.all(12.0),
            itemBuilder: (BuildContext context, int index) {
              return _buildItemCard(context, items[index]);
            }),
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
    return Column(
      children: [
        const SizedBox(height: 10),
        CategorySliderWidget(
          categories: p.getCategories,
          listener: onCategorySelectionChanged,
        ),
        _buildItemList(context),
      ],
    );
  }
}
