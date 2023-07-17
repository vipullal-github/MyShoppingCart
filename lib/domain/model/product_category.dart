class ProductCategory {
  int id;
  String name;
  String description;
  String imageName;
  DateTime createDate;
  DateTime lastModified;

  ProductCategory(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageName,
      required this.createDate,
      required this.lastModified});

  ProductCategory.newItem(
      {required this.name,
      required this.description,
      required this.imageName,
      required this.createDate,
      required this.lastModified})
      : id = -1;
}
