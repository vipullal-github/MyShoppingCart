import 'package:flutter/material.dart';

import '../../domain/model/cart_item.dart';

class ShoppingItemCard extends StatelessWidget {
  final CartItem cartItem;
  const ShoppingItemCard({super.key, required this.cartItem});

  void _updateQuantity(String value) {}

  @override
  Widget build(BuildContext context) {
    TextStyle? tsHeading = Theme.of(context).textTheme.bodyMedium;

    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/product_images/grapes.jpeg",
                fit: BoxFit.fill),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    cartItem.itemName,
                    style: tsHeading,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    cartItem.onOrder.toString(),
                  )
                ],
              ),
              // TextField(
              //   maxLines: 1,
              //   maxLength: 5,
              //   onChanged: (String value) => _updateQuantity(value),
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Qty',
              //   ),
              // ),
              Text(cartItem.description),
            ],
          ),
        ],
      ),
    );
  }
}
