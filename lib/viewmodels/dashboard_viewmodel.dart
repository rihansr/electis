import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/strings.dart';
import 'base_viewmodel.dart';

class DashboardViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldkey;

  DashboardViewModel() : scaffoldkey = GlobalKey<ScaffoldState>();

  // List of navigation items
  List<Map<String, dynamic>> get navItems => [
        {
          'tag': 'home',
          'icon': Iconsax.home_1,
          'icon_fill': Iconsax.home5,
          'label': string.home,
        },
        {
          'tag': 'feeds',
          'icon': Iconsax.lamp_on,
          'icon_fill': Iconsax.lamp_charge,
          'label': string.feeds,
        },
        {
          'tag': 'likes',
          'icon': Iconsax.heart4,
          'icon_fill': Iconsax.heart5,
          'label': string.likes,
        },
        {
          'tag': 'cart',
          'icon': Iconsax.shopping_cart,
          'icon_fill': Iconsax.shopping_cart5,
          'label': string.cart,
        },
        {
          'tag': 'profile',
          'icon': Iconsax.user,
          'icon_fill': Iconsax.user,
          'label': string.profile,
        },
      ];

  // Getter for the current navigation item
  Map<String, dynamic> get currentNavItem => navItems[currentTab];

  // Private variable for the current tab
  int _currentTab = 0;

  // Getter and setter for the current tab
  int get currentTab => _currentTab;
  set currentTab(int tab) => this
    .._currentTab = tab
    ..notify;
}
