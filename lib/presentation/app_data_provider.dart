import 'package:flutter/material.dart';
import 'package:my_shopping_cart/domain/repository/repository_interface.dart';

class AppDataProvider with ChangeNotifier {

  String appTitle = "Shopping Lists";
  RepositoryInterface repository;

  AppDataProvider( {required this.repository});

  

}
