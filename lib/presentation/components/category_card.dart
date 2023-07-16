import 'package:flutter/material.dart';
import 'package:my_shopping_cart/domain/model/product_category.dart';

class CategoryCard extends StatelessWidget {
  final ProductCategory category;
  final GestureTapCallback onPressed;

  const CategoryCard(
      {super.key, required this.category, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    TextStyle ts = Theme.of(context)
        .primaryTextTheme
        .bodySmall!
        .copyWith(color: Colors.white);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
            width: 120,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    category.imageName,
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      category.description,
                      style: ts,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
