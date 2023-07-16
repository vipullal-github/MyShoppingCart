import 'package:my_shopping_cart/domain/model/product.dart';
import '../model/product_category.dart';

abstract class RepositoryInterface {
  Future<List<ProductCategory>> getAllCategories();
  Future<List<Product>> getAllItems();
}
