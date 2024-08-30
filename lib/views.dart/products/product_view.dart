import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/extensions.dart';
import '../../models/product/product_model.dart';
import '../../viewmodels/base_viewmodel.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../viewmodels/product_viewmodel.dart';
import '../../shared/strings.dart';
import '../../widgets/badge_widget.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/clipper_widget.dart';
import '../../widgets/listview_builder.dart';
import '../order/cart_view.dart';
import 'components/color_item.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.tag,
    required this.product,
  });

  final String tag;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseWidget<ProductViewModel>(
      model: ProductViewModel(context, product),
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Iconsax.arrow_left_2),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => popupCart(context),
                padding: EdgeInsets.zero,
                icon: Badges.count(
                  count: provider<CartViewModel>(context: context, listen: true)
                      .totalItems,
                  child: const Icon(Iconsax.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Clipper(
                    color: theme.cardColor,
                    radius: 16,
                    alignment: Alignment.center,
                    child: Hero(
                      tag: '${tag}_{icon}',
                      child: Image.asset(
                        controller.product.image ?? '',
                        height: 192,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Clipper(
                      shape: const StadiumBorder(),
                      color: theme.colorScheme.primary,
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Text(
                        'RP ${controller.product.price.toStringAsFixed(3)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.product.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: string.star,
                          style: const TextStyle(color: Colors.orange),
                        ),
                        TextSpan(
                          text: controller.product.rating.toStringAsFixed(1),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 72,
              child: ListViewBuilder.horizontal(
                items: {
                  'New': controller.product.isNew,
                  'Top Deals': controller.product.topDeals,
                  'Popular': controller.product.isPopular,
                }.entries.toList(),
                spacing: const EdgeInsets.all(16),
                itemSpacing: 8,
                builder: (item, index) => ChoiceChip(
                  key: ValueKey(item.key),
                  label: Text(item.key),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  selected: item.value,
                ),
              ),
            ),
            ...controller.product.attributes.map((attribute) {
              return ListTile(
                title: Text(attribute.name ?? ''),
                subtitle: SizedBox(
                  height: 64,
                  child: ListViewBuilder.horizontal(
                    items: attribute.options,
                    itemSpacing: 8,
                    builder: (item, index) {
                      bool isSelected = controller.selectedOptions[attribute]
                              ?.contains(item) ??
                          false;
                      return attribute.slug == 'color'
                          ? InkWell(
                              onTap: () => controller.selectedOption =
                                  MapEntry(attribute, isSelected ? [] : [item]),
                              child: ColorItem(
                                color: ColorExtension(item.name!).color,
                                isSelected: isSelected,
                              ),
                            )
                          : ChoiceChip(
                              key: ValueKey(item),
                              label: Text(item.name ?? ''),
                              selected: isSelected,
                              onSelected: (_) => controller.selectedOption =
                                  MapEntry(attribute, isSelected ? [] : [item]),
                            );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: controller.addToCart,
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          icon: const Icon(Iconsax.shopping_cart, size: 18),
          label: const Text('Add to Cart', style: TextStyle(height: 1)),
        ),
      ),
    );
  }
}
