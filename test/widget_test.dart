import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_shopping_cart/data/mock_repository.dart';
import 'package:my_shopping_cart/domain/model/cart_item.dart';
import 'package:my_shopping_cart/presentation/app_data_provider.dart';
import 'package:my_shopping_cart/presentation/favorites_page/favorites_page.dart';
import 'package:my_shopping_cart/presentation/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('favorites page shows empty state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppDataProvider(repository: MockRepository()),
          ),
          ChangeNotifierProvider(
            create: (_) => ShoppingCartProvider()..createNewShoppingList(),
          ),
        ],
        child: const MaterialApp(home: FavoritesPage()),
      ),
    );

    expect(find.text("You don't have any favorites"), findsOneWidget);
  });

  testWidgets('favorites page adds, removes, and unfavorites items',
      (WidgetTester tester) async {
    final appProvider = AppDataProvider(repository: MockRepository());
    final cartProvider = ShoppingCartProvider();
    await cartProvider.createNewShoppingList();

    final favorite = CartItem(
      id: 1,
      itemName: 'Apples',
      description: 'Fresh apples',
      categoryId: 1,
      unit: 'kg',
      usualPrice: 2.0,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      isFavorite: true,
    );
    cartProvider.favouritesList.add(favorite);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: appProvider),
          ChangeNotifierProvider.value(value: cartProvider),
        ],
        child: const MaterialApp(home: FavoritesPage()),
      ),
    );

    expect(find.text('Apples'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(cartProvider.itemCount, 1);
    expect(cartProvider.getCartItems().first.onOrder, 1);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(cartProvider.itemCount, 0);

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    expect(cartProvider.favouritesList, isEmpty);
    expect(find.text("You don't have any favorites"), findsOneWidget);
  });
}
