import 'package:my_shopping_cart/domain/model/master_list_item.dart';
import '../model/item_category.dart';

abstract class RepositoryInterface {
  List<ItemCategory> getAllCategories();
  List<MasterListItem> getAllItems();
}
