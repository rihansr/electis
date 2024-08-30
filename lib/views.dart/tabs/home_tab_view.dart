import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/other/banner_model.dart' as slider;
import '../../models/category/category_model.dart';
import '../../models/product/product_model.dart';
import '../../routing/routes.dart';
import '../../shared/local_data.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/clipper_widget.dart';
import '../../widgets/listview_builder.dart';
import '../../widgets/slider_builder.dart';
import 'components.dart/product_item.dart';
import 'components.dart/title_bar.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onInit: (controller) => controller.setProducts(),
      builder: (context, controller, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            key: const ValueKey('categories'),
            child: SizedBox(
              height: 72,
              child: ListViewBuilder<Category>.horizontal(
                items: controller.categories,
                itemSpacing: 8,
                spacing: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                builder: (Category item, int index) => ChoiceChip(
                  label: Text(item.name ?? ""),
                  selected: item == controller.selectedCategory,
                  onSelected: (selected) =>
                      controller.selectedCategory = selected ? item : null,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: const ValueKey('banners'),
            child: SliderBuilder<slider.Banner>(
              aspectRatio: 2,
              sliders: controller.banners,
              itemBuilder: (banner) => Clipper(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backdrop: DecorationImage(
                  image: AssetImage(banner.image ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList.list(
            key: const ValueKey('products'),
            children: [
              const SizedBox(height: 8),
              if (controller.topDeals.isNotEmpty) ...[
                TitleBar(
                  title: 'Electis Choice',
                  onAction: () => context.pushNamed(
                    Routes.allProducts,
                    extra: {
                      'category': controller.selectedCategory,
                      'tag': local.tags.firstWhereOrNull(
                        (tag) => tag.slug == 'top_deals',
                      ),
                    },
                  ),
                ),
                SizedBox(
                  key: const ValueKey('electis_choice_products'),
                  height: 196,
                  child: ListViewBuilder<Product>.horizontal(
                    items: controller.topDeals,
                    itemSpacing: 8,
                    spacing: const EdgeInsets.symmetric(horizontal: 16),
                    builder: (Product item, int index) => SizedBox(
                      key: ValueKey(index),
                      width: 148,
                      child: ProductItem(
                        item: item,
                        tag: 'electis_choice_${item.id}',
                      ),
                    ),
                  ),
                ),
              ],
              if (controller.newArrivals.isNotEmpty) ...[
                TitleBar(
                  title: 'New Arrival',
                  onAction: () => context.pushNamed(
                    Routes.allProducts,
                    extra: {
                      'category': controller.selectedCategory,
                      'tag': local.tags.firstWhereOrNull(
                        (tag) => tag.slug == 'latest',
                      ),
                    },
                  ),
                ),
                SizedBox(
                  key: const ValueKey('new_arrival_products'),
                  height: 196,
                  child: ListViewBuilder<Product>.horizontal(
                    items: controller.newArrivals,
                    itemSpacing: 8,
                    spacing: const EdgeInsets.symmetric(horizontal: 16),
                    builder: (Product item, int index) => SizedBox(
                      key: ValueKey(index),
                      width: 148,
                      child: ProductItem(
                        item: item,
                        tag: 'new_arrival_${item.id}',
                      ),
                    ),
                  ),
                ),
              ],
              if (controller.popularProducts.isNotEmpty) ...[
                TitleBar(
                  title: 'Popular',
                  onAction: () => context.pushNamed(
                    Routes.allProducts,
                    extra: {
                      'category': controller.selectedCategory,
                      'tag': local.tags.firstWhereOrNull(
                        (tag) => tag.slug == 'popular',
                      ),
                    },
                  ),
                ),
                SizedBox(
                  key: const ValueKey('popular_products'),
                  height: 196,
                  child: ListViewBuilder<Product>.horizontal(
                    items: controller.popularProducts,
                    itemSpacing: 8,
                    spacing: const EdgeInsets.symmetric(horizontal: 16),
                    builder: (Product item, int index) => SizedBox(
                      key: ValueKey(index),
                      width: 148,
                      child: ProductItem(
                        item: item,
                        tag: 'popular_${item.id}',
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),

      /* builder: (context, controller, _) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 72,
            child: ListViewBuilder<Category>.horizontal(
              items: controller.categories,
              itemSpacing: 8,
              spacing: const EdgeInsets.symmetric(horizontal: 16),
              builder: (Category item, int index) => ChoiceChip(
                label: Text(item.name ?? ""),
                selected: item == controller.selectedCategory,
                onSelected: (_) => controller.selectedCategory = item,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SliderBuilder<slider.Banner>(
            aspectRatio: 2,
            sliders: controller.banners,
            itemBuilder: (banner) => Clipper(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backdrop: DecorationImage(
                image: AssetImage(banner.image ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TitleBar(
            title: 'Electis Choice',
            onAction: () {},
          ),
          SizedBox(
            height: 196,
            child: ListViewBuilder<Product>.horizontal(
              items: controller.products,
              itemSpacing: 8,
              spacing: const EdgeInsets.symmetric(horizontal: 16),
              builder: (Product item, int index) => SizedBox(
                key: ValueKey(index),
                width: 148,
                child: ProductItem(item),
              ),
            ),
          ),
          TitleBar(
            title: 'New Arrival',
            onAction: () {},
          ),
          SizedBox(
            height: 196,
            child: ListViewBuilder<Product>.horizontal(
              items: controller.products,
              itemSpacing: 8,
              reverse: true,
              spacing: const EdgeInsets.symmetric(horizontal: 16),
              builder: (Product item, int index) => SizedBox(
                key: ValueKey(index),
                width: 148,
                child: ProductItem(item),
              ),
            ),
          ),
          TitleBar(
            title: 'Popular',
            onAction: () {},
          ),
          SizedBox(
            height: 196,
            child: ListViewBuilder<Product>.horizontal(
              items: controller.products,
              itemSpacing: 8,
              spacing: const EdgeInsets.symmetric(horizontal: 16),
              builder: (Product item, int index) => SizedBox(
                key: ValueKey(index),
                width: 148,
                child: ProductItem(item),
              ),
            ),
          ),
        ],
      ), */
    );
  }
}
