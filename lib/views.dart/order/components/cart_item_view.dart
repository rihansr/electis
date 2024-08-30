import 'package:flutter/material.dart';
import '../../../models/cart/cart_item_model.dart';
import '../../../widgets/clipper_widget.dart';
import '../../products/components/color_item.dart';
import '../../../shared/extensions.dart';

class CartItemView extends StatelessWidget {
  final CartItem item;
  final Function(CartItem item)? onRemove;
  const CartItemView({
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
            child: Image.asset(
              item.product.image ?? "",
              fit: BoxFit.contain,
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
                    item.product.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'RP ${item.product.price.toStringAsFixed(3)}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: item.options
                          .map(
                            (option) => ColorItem(
                              color: ColorExtension(option.name ?? '').color,
                              size: 24,
                            ),
                          )
                          .toList(),
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
              icon: Icon(
                Icons.close,
                size: 20,
                color: theme.hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
