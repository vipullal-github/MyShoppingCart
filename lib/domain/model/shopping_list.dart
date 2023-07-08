import 'cart_item.dart';

class ShoppingList {
  int id;
  String name;
  DateTime created;
  DateTime modified;
  List<CartItem> itemList;

  ShoppingList({
    required this.id,
    required this.name,
    required this.created,
    required this.modified,
  }) : itemList = [];

  ShoppingList.newRecord({
    required this.name,
    required this.created,
    required this.modified,
  })  : id = -1,
        itemList = [];
}
