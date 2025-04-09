class Product {
  int id;
  int categoryId;
  String itemName;
  String description;
  double usualPrice;
  String unit;
  bool isFavorite;
  DateTime createDate;
  DateTime lastModified;
  String image;

  Product(
      {required this.id,
      required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit,
      required this.createDate,
      required this.lastModified,
      required this.image,
      this.isFavorite = false});

  Product.newRecord(
      {required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit,
      required this.createDate,
      required this.lastModified,
      required this.image,
      this.isFavorite = false})
      : id = -1;
}
