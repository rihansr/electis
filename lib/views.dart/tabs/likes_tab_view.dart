import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../routing/routes.dart';
import '../../shared/drawables.dart';
import '../../viewmodels/favourites_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/listview_builder.dart';
import 'components.dart/favourite_item.dart';

class LikesTabView extends StatelessWidget {
  const LikesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<FavouritesViewModel>(
      model: Provider.of<FavouritesViewModel>(context),
      builder: (context, controller, _) => IndexedStack(
        index: controller.favourites.isEmpty ? 0 : 1,
        children: [
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(drawable.empty, height: 128),
          ),
          ListViewBuilder.vertical(
            items: controller.favourites,
            spacing: const EdgeInsets.all(16),
            itemSpacing: 8,
            onItemSelected: (item) => context.pushNamed(
              Routes.product,
              extra: {'product': item, 'tag': 'favourite_${item.id}'},
            ),
            builder: (item, i) => FavouriteItem(
              key: ValueKey(item.id),
              item: item,
              onRemove: (item) => controller.removeFromFavourites(item, i),
            ),
          ),
        ],
      ),
    );
  }
}
