import 'package:flutter/material.dart';

import '../../domain/model/cart_item.dart';

class ShoppingItemCard extends StatelessWidget {
  final CartItem cartItem;
  const ShoppingItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(cartItem.description),
    );
  }
}
