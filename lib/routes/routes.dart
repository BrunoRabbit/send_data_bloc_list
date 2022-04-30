import 'package:flutter/material.dart';
import 'package:send_data_bloc_list/view/home_page.dart';
import 'package:send_data_bloc_list/view/item_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homePage: (_) => const HomePage(),
    RoutesPath.itemPage: (_) => const ItemPage(),
  };
}

class RoutesPath {
  static const homePage = '/home-page';
  static const itemPage = '/item-page';
}
