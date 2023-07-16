class ProductCategory {
  int id;
  String name;
  String description;
  String imageName;

  ProductCategory(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageName});

  ProductCategory.newItem(
      {required this.name, required this.description, required this.imageName})
      : id = -1;
}
