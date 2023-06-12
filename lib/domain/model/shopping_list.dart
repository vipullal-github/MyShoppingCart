import 'cart_item.dart';
import 'item_category.dart';

class ShoppingList {
  int id;
  String name;
  DateTime created;
  DateTime modified;
  final Map<ItemCategory, List<CartItem>> items = {};

  ShoppingList({
    required this.id,
    required this.name,
    required this.created,
    required this.modified,
  });

  ShoppingList.newRecord({
    required this.name,
    required this.created,
    required this.modified,
  }) : id = -1;
}
