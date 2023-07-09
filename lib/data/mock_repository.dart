import '../domain/model/item_category.dart';
import '../domain/model/master_list_item.dart';
import '../domain/repository/repository_interface.dart';

class MockRepository implements RepositoryInterface {
  List<ItemCategory> allCategories = [
    ItemCategory(
      id: 1,
      name: "Produce",
      description: "Vegetables, Eggs, etc",
      imageName: "assets/images/categories/vegetables.jpg",
    ),
    ItemCategory(
      id: 2,
      name: "Household Essentials",
      description: "Dish washing soap, Cleaning ",
      imageName: "assets/images/categories/vegetables.jpg",
    ),
    ItemCategory(
      id: 3,
      name: "Beauty Care",
      description: "Toothpaste, creams",
      imageName: "assets/images/categories/vegetables.jpg",
    ),
    ItemCategory(
      id: 4,
      name: "Beverages",
      description: "Softdrinks, Wine",
      imageName: "assets/images/categories/vegetables.jpg",
    )
  ];

  List<MasterListItem> allItems = [
    MasterListItem(
        id: 1,
        categoryId: 1,
        itemName: "Carrots",
        description: "Fresh carrots",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 2,
        categoryId: 1,
        itemName: "Cabbage",
        description: "Green stuff",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 3,
        categoryId: 1,
        itemName: "Broccoli",
        description: "",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 4,
        categoryId: 1,
        itemName: "Bitter Gourd",
        description: "Great for your skin!",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 5,
        categoryId: 1,
        itemName: "Tomatoes",
        description: "Red tomatoes",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 6,
        categoryId: 1,
        itemName: "Potatoes",
        description: "Russet Potatoes (USA)",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 7,
        categoryId: 1,
        itemName: "Onions",
        description: "Red Onions",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 8,
        categoryId: 1,
        itemName: "Paneer",
        description: "Fresh frozen paneer",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 9,
        categoryId: 1,
        itemName: "Eggs",
        description: "Fresh Eggs",
        unit: "Dozzen",
        usualPrice: 2.30),
    MasterListItem(
        id: 10,
        categoryId: 1,
        itemName: "Tomatoes",
        description: "Fresh Tomatoes",
        unit: "kg",
        usualPrice: 1.80),
    MasterListItem(
        id: 11,
        categoryId: 1,
        itemName: "Carrots",
        description: "Fresh carrots",
        unit: "kg",
        usualPrice: 2.30),
    MasterListItem(
        id: 12,
        categoryId: 2,
        itemName: "Harpic",
        description: "Chlorox bleach for sparkling toilets",
        unit: "bottle",
        usualPrice: 3.69),
    MasterListItem(
        id: 13,
        categoryId: 2,
        itemName: "DishWash",
        description: "Lemon Dishwash",
        unit: "Pack of 5",
        usualPrice: 4.95),
    MasterListItem(
        id: 14,
        categoryId: 2,
        itemName: "Toilet Paper",
        description: "Soft and Dry",
        unit: "Pack of 10",
        usualPrice: 2.30),
    MasterListItem(
        id: 15,
        categoryId: 4,
        itemName: "Pepsi",
        description: "Cola Drink",
        unit: "Bottle",
        usualPrice: 1.85),
    MasterListItem(
        id: 16,
        categoryId: 4,
        itemName: "Coke",
        description: "Coca Cola ",
        unit: "Bottle",
        usualPrice: 1.90),
  ];

  @override
  Future<List<ItemCategory>> getAllCategories() async {
    return Future.delayed(const Duration(seconds: 1), () => allCategories);
  }

  @override
  Future<List<MasterListItem>> getAllItems() {
    return Future.delayed(const Duration(seconds: 1), () => allItems);
  }
}
