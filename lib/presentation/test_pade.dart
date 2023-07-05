
import 'package:flutter/material.dart';
import 'package:my_shopping_cart/presentation/components/category_slider.dart';


class TestPage extends StatefulWidget {
  const TestPage({super.key});

@override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TestPage")),
      body: const CategorySliderWidget(),
  );
}
}