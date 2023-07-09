class MasterListItem {
  int id;
  int categoryId;
  String itemName;
  String description;
  double usualPrice;
  String unit;
  String? image;

  MasterListItem(
      {required this.id,
      required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit,
      this.image});

  MasterListItem.newRecord(
      {required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit,
      this.image})
      : id = -1;
}
