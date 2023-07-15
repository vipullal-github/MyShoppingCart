import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

import '../../domain/model/cart_item.dart';

class ShoppingItemCard extends StatefulWidget {
  final CartItem cartItem;
  const ShoppingItemCard({super.key, required this.cartItem});

  @override
  State<ShoppingItemCard> createState() => _ShoppingItemCardState();
}

class _ShoppingItemCardState extends State<ShoppingItemCard> {
  late TextEditingController _editController;

  @override
  void initState() {
    _editController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _editController.dispose();
  }

  void _incrementOnOrder(BuildContext context) {
    widget.cartItem.onOrder += 1;
    _editController.text = widget.cartItem.onOrder.toString();
    context.read<ShoppingCartProvider>().updateCart(widget.cartItem);
  }

  void _decrementOnOrder(BuildContext context) {
    if (widget.cartItem.onOrder > 0) {
      widget.cartItem.onOrder -= 1;
      _editController.text = widget.cartItem.onOrder.toString();
      context.read<ShoppingCartProvider>().updateCart(widget.cartItem);
    }
  }

  void _updateItemCount(BuildContext context, String value) {
    try {
      widget.cartItem.onOrder = double.parse(value);
    } catch (e) {
      widget.cartItem.onOrder = 0;
    }
    context.read<ShoppingCartProvider>().updateCart(widget.cartItem);
  }

  Widget _upDownControl(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: () => _decrementOnOrder(context),
            icon: Icon(
              Icons.remove,
              size: 24,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 80,
            child: TextField(
              maxLength: 5,
              onChanged: (value) => _updateItemCount(context, value),
              controller: _editController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                isDense: true,
                counterText: "",
              ),
            ),
          ),
          IconButton(
            onPressed: () => _incrementOnOrder(context),
            icon: Icon(
              Icons.add,
              size: 24,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset("assets/images/product_images/grapes.jpeg",
          fit: BoxFit.fill),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? tsHeading = Theme.of(context)
        .textTheme
        .labelLarge!
        .apply(color: Colors.black87)
        .apply(fontWeightDelta: 10);
    TextStyle? tsDescription =
        Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black45);
    TextStyle? tsPrice =
        Theme.of(context).textTheme.labelLarge!.apply(color: Colors.green);
    _editController.text = widget.cartItem.onOrder.toString();

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: _productImage(context),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cartItem.itemName, style: tsHeading),
                  const SizedBox(height: 3),
                  Text(widget.cartItem.description, style: tsDescription),
                  const SizedBox(height: 3),
                  Text(
                      "Today's Price: ${widget.cartItem.usualPrice}/${widget.cartItem.unit} only",
                      style: tsPrice),
                  const SizedBox(height: 3),
                  _upDownControl(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
