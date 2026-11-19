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
        imageName: "assets/images/categories/toiletries.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
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
      image: "carrots.jpg",
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
    ),
    Product(
      id: 2,
      categoryId: 1,
      itemName: "Cabbage",
      description: "Green stuff",
      unit: "kg",
      usualPrice: 2.30,
      image: "cabbage.jpg",
      createDate: DateTime.now(),
      lastModified: DateTime.now(),
    ),
    Product(
        id: 3,
        categoryId: 1,
        itemName: "Broccoli",
        description: "",
        unit: "kg",
        usualPrice: 2.30,
        image: "broccoli.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now(),
        isFavorite: true),
    Product(
        id: 4,
        categoryId: 1,
        itemName: "Bitter Gourd",
        description: "Great for your skin!",
        unit: "kg",
        usualPrice: 2.30,
        image: "bitter_gourd.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 5,
        categoryId: 1,
        itemName: "Tomatoes",
        description: "Red tomatoes",
        unit: "kg",
        usualPrice: 2.30,
        image: "tomatoes.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 6,
        categoryId: 1,
        itemName: "Potatoes",
        description: "Russet Potatoes (USA)",
        unit: "kg",
        usualPrice: 2.30,
        image: "potatoes.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 7,
        categoryId: 1,
        itemName: "Onions",
        description: "Red Onions",
        unit: "kg",
        usualPrice: 2.30,
        image: "onions.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 9,
        categoryId: 1,
        itemName: "Eggs",
        description: "Fresh Eggs",
        unit: "Dozen",
        usualPrice: 2.30,
        image: "eggs.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
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
        id: 13,
        categoryId: 2,
        itemName: "DishWash",
        description: "Lemon Dishwash",
        unit: "Pack of 5",
        usualPrice: 4.95,
        image: "grapes.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 14,
        categoryId: 2,
        itemName: "Toilet Paper",
        description: "Soft and Dry",
        unit: "Pack of 10",
        usualPrice: 2.30,
        image: "grapes.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 15,
        categoryId: 4,
        itemName: "Pepsi",
        description: "Cola Drink",
        unit: "Bottle",
        image: "pepsi.jpg",
        usualPrice: 1.85,
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
    Product(
        id: 16,
        categoryId: 4,
        itemName: "Coke",
        description: "Coca Cola ",
        unit: "Bottle",
        usualPrice: 1.90,
        image: "coke.jpg",
        createDate: DateTime.now(),
        lastModified: DateTime.now()),
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
