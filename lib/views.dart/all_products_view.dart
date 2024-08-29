import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../models/category/category_model.dart';
import '../viewmodels/products_viewmodel.dart';
import '../widgets/base_widget.dart';
import '../widgets/listview_builder.dart';
import 'search_view.dart';
import 'tabs/components.dart/product_item.dart';

class AllProductsView extends StatelessWidget {
  final Category? category;
  final Category? tag;
  const AllProductsView({
    super.key,
    required this.category,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseWidget<ProductsViewModel>(
      model: ProductsViewModel(context, category: category, tag: tag),
      onInit: (controller) => controller.init(),
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          title: Text(tag?.name ?? category?.name ?? ''),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Iconsax.arrow_left_2),
          ),
          actions: [
            IconButton(
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => const SearchProductsView(),
              ),
              icon: const Icon(Iconsax.search_normal_1),
            ),
          ],
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 72,
              floating: true,
              flexibleSpace: Row(
                children: [
                  Expanded(
                    child: ListViewBuilder(
                      scrollDirection: Axis.horizontal,
                      spacing: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      items: controller.tags,
                      itemSpacing: 8,
                      builder: (context, index) {
                        final filter = controller.tags[index];
                        return ChoiceChip(
                          label: Text(filter.name ?? ''),
                          selected: filter == controller.tag,
                          onSelected: (selected) =>
                              controller.tag = selected ? filter : null,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.popupSortOptions(),
                    icon: Icon(
                      Iconsax.setting_4,
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = controller.filterdProducts[index];
                    return ProductItem(product);
                  },
                  childCount: controller.filterdProducts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
