import 'package:flutter/material.dart';
import 'package:my_shopping_cart/domain/model/cart_item.dart';
import 'package:my_shopping_cart/presentation/components/shopping_item_card.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  Widget _emptyFavoritesWidget(BuildContext context) {
    return const Center(
      child: Text("You don't have any favorites"),
    );
  }

  Widget _favoritesList(BuildContext context, List<CartItem> favoriteItems) {
    return ListView.builder(
      itemCount: favoriteItems.length,
      padding: const EdgeInsets.all(12.0),
      itemBuilder: (BuildContext context, int index) {
        return ShoppingItemCard(cartItem: favoriteItems[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ShoppingCartProvider sp = context.watch<ShoppingCartProvider>();
    List<CartItem> favoriteItems = sp.favouritesList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoritesPage"),
      ),
      body: favoriteItems.isEmpty
          ? _emptyFavoritesWidget(context)
          : _favoritesList(context, favoriteItems),
    );
  }
}
