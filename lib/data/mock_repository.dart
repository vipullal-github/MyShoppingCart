import '../domain/model/product_category.dart';
import '../domain/model/product.dart';
import '../domain/repository/repository_interface.dart';

class MockRepository implements RepositoryInterface {
  List<ProductCategory> allCategories = [
    ProductCategory(
        id: 1,
        name: "Produce",
        description: "Vegetables, Eggs, etc",
        imageName: "assets/images/categories/vegetables.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    ProductCategory(
      id: 2,
      name: "Household Essentials",
      description: "Dish washing soap, Cleaning ",
      imageName: "assets/images/categories/household.jpg",
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
    ),
    ProductCategory(
        id: 3,
        name: "Beauty Care",
        description: "Toothpaste, creams",
        imageName: "assets/images/categories/drinks.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    ProductCategory(
        id: 4,
        name: "Beverages",
        description: "Softdrinks, Wine",
        imageName: "assets/images/categories/vegetables.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now())
  ];

  List<Product> allItems = [
    Product(
        id: 1,
        categoryId: 1,
        itemName: "Carrots",
        description: "Fresh carrots",
        unit: "kg",
        usualPrice: 2.30,
        createDate: DateTime.now(),
        lastModified: DateTime.now(),
        image: "carrots.jpg"),
    Product(
        id: 2,
        categoryId: 1,
        itemName: "Cabbage",
        description: "Green stuff",
        unit: "kg",
        usualPrice: 2.30,
        createDate: DateTime.now(),
        lastModified: DateTime.now(),
        image: "cabbage.jpg",
        isFavorite: true),
    Product(
        id: 3,
        categoryId: 1,
        itemName: "Broccoli",
        description: "",
        unit: "kg",
        usualPrice: 2.30,
        createDate: DateTime.now(),
        lastModified: DateTime.now(),
        image: "broccoli.jpg",
        isFavorite: true),
    Product(
        id: 4,
        categoryId: 1,
        itemName: "Bitter Gourd",
        description: "Great for your skin!",
        unit: "kg",
        usualPrice: 2.30,
        createDate: DateTime.now(),
        lastModified: DateTime.now(),
        image: "bitter_gourd.jpg"),
    Product(
      id: 5,
      categoryId: 1,
      itemName: "Tomatoes",
      description: "Red tomatoes",
      unit: "kg",
      usualPrice: 2.30,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "tomatoes.jpg",
    ),
    Product(
      id: 6,
      categoryId: 1,
      itemName: "Potatoes",
      description: "Russet Potatoes (USA)",
      unit: "kg",
      usualPrice: 2.30,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "potatoes.jpg",
    ),
    Product(
      id: 7,
      categoryId: 1,
      itemName: "Onions",
      description: "Red Onions",
      unit: "kg",
      usualPrice: 2.30,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "onions.jpg",
    ),
    Product(
      id: 9,
      categoryId: 1,
      itemName: "Eggs",
      description: "Fresh Eggs",
      unit: "Dozzen",
      usualPrice: 2.30,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "eggs.jpg",
    ),
    Product(
      id: 10,
      categoryId: 1,
      itemName: "Tomatoes",
      description: "Fresh Tomatoes",
      unit: "kg",
      usualPrice: 1.80,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "tomatoes.jpg",
    ),
    Product(
      id: 12,
      categoryId: 2,
      itemName: "Harpic",
      description: "Chlorox bleach for sparkling toilets",
      unit: "bottle",
      usualPrice: 3.69,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "harpic.jpg",
    ),
    Product(
      id: 12,
      categoryId: 2,
      itemName: "DishWash",
      description: "Lemon Dishwash",
      unit: "Pack of 5",
      usualPrice: 4.95,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "dish_wash.jpg",
    ),
    Product(
      id: 13,
      categoryId: 2,
      itemName: "Toilet Paper",
      description: "Soft and Dry",
      unit: "Pack of 10",
      usualPrice: 2.30,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "toilet_paper.jpg",
    ),
    Product(
      id: 14,
      categoryId: 4,
      itemName: "Pepsi",
      description: "Cola Drink",
      unit: "Bottle",
      usualPrice: 1.85,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "pepsi.jpg",
    ),
    Product(
      id: 15,
      categoryId: 4,
      itemName: "Coke",
      description: "Coca Cola ",
      unit: "Bottle",
      usualPrice: 1.90,
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
      image: "coke.jpg",
    ),
  ];

  @override
  Future<List<ProductCategory>> getAllCategories() async {
    return Future.delayed(const Duration(seconds: 1), () => allCategories);
  }

  @override
  Future<List<Product>> getAllItems() {
    return Future.delayed(const Duration(seconds: 1), () => allItems);
  }
}
