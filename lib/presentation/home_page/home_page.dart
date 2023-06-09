import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSheet = 0;

  void onTabSelected(int index) {
    if (index != currentSheet) {
      setState(
        () {
          currentSheet = index;
        },
      );
    }
  }

  Widget _buildWidgets(BuildContext context) {
    if (currentSheet == 0) {
      return _buildCartView(context);
    } else {
      return _buildHistoryView(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentSheet,
          onTap: (value) => onTabSelected(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ]),
      body: _buildWidgets(context),
    );
  }

  Widget _buildCartView(BuildContext context) {
    return const Text("Cart view");
  }

  Widget _buildHistoryView(BuildContext context) {
    return const Text("History view");
  }
}
