import 'package:electis/widgets/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/extensions.dart';
import '../../models/product/product_model.dart';
import '../../viewmodels/product_viewmodel.dart';
import '../../shared/strings.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/clipper_widget.dart';
import 'components/color_item.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

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
                    child: Image.asset(
                      controller.product.image ?? '',
                      height: 192,
                      fit: BoxFit.contain,
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('New'),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    selected: controller.product.isNew,
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Top Deals'),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    selected: controller.product.topDeals,
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('Popular'),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    selected: controller.product.isPopular,
                  ),
                ],
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
          onPressed: () => '',
          backgroundColor: theme.colorScheme.primary,
          icon: const Icon(
            Iconsax.shopping_cart,
            size: 20,
            color: Colors.white,
          ),
          label: const Text('Add to Cart'),
        ),
      ),
    );
  }
}