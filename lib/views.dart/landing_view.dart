import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../viewmodels/base_viewmodel.dart';
import '../viewmodels/cart_viewmodel.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/badge_widget.dart';
import '../widgets/base_widget.dart';
import 'others/addresses_view.dart';
import 'order/cart_view.dart';
import 'tabs/components.dart/search_bar.dart';
import 'tabs/home_tab_view.dart';
import 'tabs/likes_tab_view.dart';
import 'tabs/feeds_tab_view.dart';
import 'tabs/profile_tab_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: Provider.of<DashboardViewModel>(context),
      builder: (context, controller, child) => Scaffold(
        key: controller.scaffoldkey,
        appBar: controller.currentTab == 0
            ? AppBar(
                key: const Key('app_bar_key'),
                toolbarHeight: 72,
                title: const SearchTile(),
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      key: const Key('app_bar_menu_key'),
                      icon: const Icon(Iconsax.menu_14),
                      onPressed: () => showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const AddressesView();
                        },
                      ),
                    ),
                  ),
                ],
              )
            : AppBar(
                key: const Key('app_bar_key'),
                title: Text(controller.currentNavItem['label'] ?? ''),
              ),
        body: IndexedStack(
          key: const Key('landing_main_body_key'),
          index: controller.currentTab,
          children: const [
            HomeTabView(key: PageStorageKey('home_tab_page_key')),
            FeedsTabView(key: PageStorageKey('feeds_tab_page_key')),
            LikesTabView(key: PageStorageKey('likes_tab_page_key')),
            SizedBox.shrink(),
            ProfileTabView(key: PageStorageKey('profile_tab_page_key')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: const Key('landing_main_bottom_nav_bar_key'),
          currentIndex: controller.currentTab,
          onTap: (index) {
            if (index == 3) {
              popupCart(context);
            } else {
              controller.currentTab = index;
            }
          },
          items: controller.navItems
              .map(
                (e) => BottomNavigationBarItem(
                  key: Key(e['label'] as String),
                  icon: e['tag'] == 'cart'
                      ? Badges.count(
                          count: provider<CartViewModel>(
                                  context: context, listen: true)
                              .totalItems,
                          child: Icon(e['icon'] as IconData?),
                        )
                      : Icon(e['icon'] as IconData?),
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
