class ItemCategory {
  int id;
  String name;
  String description;
  String imageName;

  ItemCategory(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageName});

  ItemCategory.newItem(
      {required this.name, required this.description, required this.imageName})
      : id = -1;
}
