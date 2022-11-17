import 'package:flutter/material.dart';
import '../src/data/model/bottom_navigation_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppData {
  const AppData._();

  static const List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(Icon(Icons.home_outlined), Icon(Icons.home), 'Home',
        isSelected: true),
    BottomNavigationItem(Icon(Icons.shopping_cart_outlined),
        Icon(Icons.shopping_cart), 'Shopping cart'),
    BottomNavigationItem(
        Icon(
          FontAwesomeIcons.clipboardList,
        ),
        Icon(
          FontAwesomeIcons.clipboardList,
        ),
        'Order'),
    // BottomNavigationItem(
    //     Icon(Icons.person_outline), Icon(Icons.person), 'Profile')
  ];
}
