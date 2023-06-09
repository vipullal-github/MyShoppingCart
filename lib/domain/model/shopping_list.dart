import 'master_list_item.dart';

class ShoppingList {
  int id;
  String name;
  DateTime created;
  DateTime modified;
  List<MasterListItem> _items = [];

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
