import 'package:flutter/material.dart';
import 'package:my_shopping_cart/domain/model/item_category.dart';

class CategoryCard extends StatelessWidget {
  final ItemCategory category;
  final GestureTapCallback onPressed;

  const CategoryCard(
      {super.key, required this.category, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
          width: 100,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children: [
                Image.asset(
                  category.imageName,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )),
    );
  }
}
