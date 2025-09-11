import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

import '../../domain/model/cart_item.dart';
import '../components/shopping_item_card.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  Widget _emptyCartWidget(BuildContext context) {
    return const Center(
      child: Text("Shopping cart is empty!"),
    );
  }

  Widget _summarySection(
      BuildContext context, List<CartItem> cartItems, double total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Text("Number of Items: ${cartItems.length}"),
                const SizedBox(height: 6),
                Text("Total: ${total.toStringAsFixed(2)}"),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Light green background
              ),
              child: const Text('Place Order'),
            ),
          )
        ],
      ),
    );
  }

  Widget _shoppingCartList(
      BuildContext context, List<CartItem> cartItems, double total) {
    return Column(
      children: [
        _summarySection(context, cartItems, total),
        // Text("Total: ${total.toStringAsFixed(2)}"),
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            padding: const EdgeInsets.all(12.0),
            itemBuilder: (BuildContext context, int index) {
              return ShoppingItemCard(cartItem: cartItems[index]);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ShoppingCartProvider sp = context.watch<ShoppingCartProvider>();
    List<CartItem> cartItems = sp.getCartItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Page"),
      ),
      body: cartItems.isEmpty
          ? _emptyCartWidget(context)
          : _shoppingCartList(context, cartItems, sp.totalAmount),
    );
  }
}
