import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/strings.dart';
import 'tabs/cart_tab_view.dart';
import 'tabs/components.dart/search_bar.dart';
import 'tabs/home_tab_view.dart';
import 'tabs/likes_tab_view.dart';
import 'tabs/feeds_tab_view.dart';
import 'tabs/profile_tab_view.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late GlobalKey<ScaffoldState> _scaffoldkey;
  List<Map<String, dynamic>> _navItems = const [];
  late ValueNotifier<int> _currentTabNotifier;

  @override
  void initState() {
    _scaffoldkey = GlobalKey<ScaffoldState>();
    _navItems = [
      {
        'icon': Iconsax.home_1,
        'icon_fill': Iconsax.home5,
        'label': string.home,
      },
      {
        'icon': Iconsax.lamp_on,
        'icon_fill': Iconsax.lamp_charge,
        'label': string.feeds,
      },
      {
        'icon': Iconsax.heart4,
        'icon_fill': Iconsax.heart5,
        'label': string.likes,
      },
      {
        'icon': Iconsax.shopping_cart,
        'icon_fill': Iconsax.shopping_cart5,
        'label': string.cart,
      },
      {
        'icon': Iconsax.user,
        'icon_fill': Iconsax.user,
        'label': string.profile,
      },
    ];
    _currentTabNotifier = ValueNotifier<int>(0);
    super.initState();
  }

  @override
  void dispose() {
    _currentTabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      key: const Key('landing_body_key'),
      valueListenable: _currentTabNotifier,
      builder: (_, currentTab, __) => Scaffold(
        key: _scaffoldkey,
        appBar: currentTab == 0
            ? AppBar(
                key: const Key('app_bar_key'),
                toolbarHeight: 72,
                title: const SearchTile(),
                elevation: 0,
                actions: [
                  IconButton(
                    key: const Key('app_bar_menu_key'),
                    icon: const Icon(Iconsax.menu),
                    onPressed: () {},
                  ),
                ],
              )
            : AppBar(
                key: const Key('app_bar_key'),
                title: Text(_navItems[currentTab]['label'] ?? ''),
              ),
        body: IndexedStack(
          key: const Key('landing_main_body_key'),
          index: currentTab,
          children: const [
            HomeTabView(key: PageStorageKey('home_tab_page_key')),
            FeedsTabView(key: PageStorageKey('feeds_tab_page_key')),
            LikesTabView(key: PageStorageKey('likes_tab_page_key')),
            CartTabView(key: PageStorageKey('cart_tab_page_key')),
            ProfileTabView(key: PageStorageKey('profile_tab_page_key')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: const Key('landing_main_bottom_nav_bar_key'),
          currentIndex: currentTab,
          onTap: (index) {
            _currentTabNotifier.value = index;
          },
          items: _navItems
              .map(
                (e) => BottomNavigationBarItem(
                  key: Key(e['label'] as String),
                  icon: Icon(e['icon'] as IconData),
                  activeIcon: Icon(e['icon_fill'] as IconData?),
                  label: e['label'] as String,
                  tooltip: e['label'] as String,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
