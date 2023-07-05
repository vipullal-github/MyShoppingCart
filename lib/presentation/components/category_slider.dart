import 'package:flutter/material.dart';

class CategorySliderWidget extends StatefulWidget {
  const CategorySliderWidget({super.key});

  @override
  State<CategorySliderWidget> createState() => _CategorySliderWidgetState();
}

class _CategorySliderWidgetState extends State<CategorySliderWidget> {
  late PageController controller;
  int numCards = 9;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    controller = PageController(initialPage: 0, viewportFraction: 0.55);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Container(
                    margin: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: colors[index]),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
