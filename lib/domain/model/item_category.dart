class ItemCategory {
  int id;
  String name;
  String description;

  ItemCategory({required this.id, required this.name, required this.description});

  ItemCategory.newItem({required this.name, required this.description}) : id = -1;
}
