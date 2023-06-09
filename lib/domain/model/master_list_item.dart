class MasterListItem {
  int id;
  int categoryId;
  String itemName;
  String description;
  double usualPrice;
  String unit;

  MasterListItem(
      {required this.id,
      required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit});

  MasterListItem.newRecord(
      {required this.categoryId,
      required this.itemName,
      required this.description,
      required this.usualPrice,
      required this.unit})
      : id = -1;
}


