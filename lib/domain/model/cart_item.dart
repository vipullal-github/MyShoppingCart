import 'master_list_item.dart';

class CartItem extends MasterListItem {
  double onOrder;

  CartItem(
      {required super.id,
      required super.itemName,
      required super.description,
      required super.categoryId,
      required super.unit,
      required super.usualPrice,
      super.image})
      : onOrder = 0.0;

  factory CartItem.fromMasterItem(MasterListItem item) {
    return CartItem(
        id: item.id,
        itemName: item.itemName,
        description: item.description,
        categoryId: item.categoryId,
        unit: item.unit,
        usualPrice: item.usualPrice,
        image: item.image);
  }
}
