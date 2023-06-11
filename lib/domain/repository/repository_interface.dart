import 'package:my_shopping_cart/domain/model/master_list_item.dart';
import '../model/item_category.dart';

abstract class RepositoryInterface {
  Future<List<ItemCategory>> getAllCategories();
  Future<List<MasterListItem>> getAllItems();
}
