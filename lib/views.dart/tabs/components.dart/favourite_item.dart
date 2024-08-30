import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../models/product/product_model.dart';
import '../../../shared/strings.dart';
import '../../../widgets/clipper_widget.dart';

class FavouriteItem extends StatelessWidget {
  final Product item;
  final Function(Product item)? onRemove;
  const FavouriteItem({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clipper(
      radius: 12,
      color: theme.disabledColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Clipper(
            radius: 8,
            color: theme.cardColor,
            size: 96,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            child: Hero(
              tag: 'favourite_${item.id}_icon',
              child: Image.asset(
                item.image ?? "",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    string.price(item.price),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox.square(
            dimension: 40,
            child: IconButton(
              onPressed: () => onRemove?.call(item),
              icon: const Icon(
                Iconsax.heart_remove4,
                size: 20,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
