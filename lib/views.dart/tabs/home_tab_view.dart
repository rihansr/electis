import 'package:electis/shared/colors.dart';
import 'package:electis/widgets/clipper_widget.dart';
import 'package:flutter/material.dart';
import '../../models/other/banner_model.dart' as slider;
import '../../models/category/category_model.dart';
import '../../models/product/product_model.dart';
import '../../shared/strings.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/listview_builder.dart';
import '../../widgets/slider_builder.dart';
import 'components.dart/title_bar.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      builder: (context, controller, _) => ListView(
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
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product item;
  const ProductItem(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tagTextStyle = theme.textTheme.bodySmall?.copyWith(
      color: ColorPalette.light().headline,
      fontWeight: FontWeight.w600,
      fontSize: 11,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 7,
          child: Card(
            child: Stack(
              children: [
                Positioned.fill(
                  top: 12,
                  bottom: 12,
                  child: Image.asset(
                    item.image ?? "",
                    fit: BoxFit.contain,
                  ),
                ),
                if (item.isNew)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Clipper(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                      color: theme.colorScheme.secondary,
                      child: Text(
                        'New',
                        style: tagTextStyle,
                      ),
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Clipper(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                    color: theme.colorScheme.tertiary,
                    child: RichText(
                      text: TextSpan(
                        text: string.star,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.orange,
                        ),
                        children: [
                          TextSpan(
                            text: item.rating.toStringAsFixed(1),
                            style: tagTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.name,
                  style: theme.textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'RP ${item.price.toStringAsFixed(3)}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
