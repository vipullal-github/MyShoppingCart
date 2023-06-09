import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'master_list/master_list_page.dart';

class RoutingManager
{
  static const String homePage = "/";
  static const String masterListPage = "/masteListPage";


  static Route<dynamic> routingFunction( RouteSettings settings){
    switch( settings.name ){
      case homePage:
        return MaterialPageRoute(builder: ( _)=> const HomePage());
      case masterListPage:
        return MaterialPageRoute(builder: ( _)=> const MasterListPage());
    default:
      throw Exception("Invalid route ${settings.name}");
    }
  }


}