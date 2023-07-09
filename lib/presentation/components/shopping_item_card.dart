import 'package:flutter/material.dart';

import '../../domain/model/cart_item.dart';

class ShoppingItemCard extends StatelessWidget {
  final CartItem cartItem;
  const ShoppingItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    TextStyle? tsHeading = Theme.of(context).textTheme.bodyMedium;

    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/product_images/grapes.jpeg"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.itemName,
                style: tsHeading,
              ),
              Text(cartItem.description)
            ],
          ),
        ],
      ),
    );
  }
}
