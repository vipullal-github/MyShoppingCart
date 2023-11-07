import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/model/cart_item.dart';
import '../../../../presentation/shopping_cart_provider.dart';
import '../../../components/shopping_item_card.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItem> items = context.watch<ShoppingCartProvider>().favouritesList;
    return items.isEmpty ? _emptyView() : _buildListView(items, context);
  }

  Widget _buildListView(List<CartItem> items, BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.all(12.0),
      itemBuilder: (BuildContext context, int index) {
        return ShoppingItemCard(cartItem: items[index]);
      },
    );
  }

  Widget _emptyView() {
    return const Center(
      child: Text("You dont have any favorites"),
    );
  }
}
