import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product/product_model.dart';
import '../../../routing/routes.dart';
import '../../../shared/colors.dart';
import '../../../shared/strings.dart';
import '../../../widgets/clipper_widget.dart';

class ProductItem extends StatelessWidget {
  final String tag;
  final Product item;
  const ProductItem({
    required this.tag,
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tagTextStyle = theme.textTheme.bodySmall?.copyWith(
      color: ColorPalette.light().headline,
      fontWeight: FontWeight.w600,
      height: 1,
      fontSize: 11,
    );
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.product,
        extra: {'product': item, 'tag': tag},
      ),
      child: Column(
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
                    child: Hero(
                      tag: '${tag}_icon',
                      child: Image.asset(
                        item.image ?? "",
                        fit: BoxFit.contain,
                      ),
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
                          string.isNew,
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
                  Text(
                    string.price(item.price),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
