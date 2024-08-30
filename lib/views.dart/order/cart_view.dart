import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../services/navigation_service.dart';
import '../../shared/drawables.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/listview_builder.dart';
import 'components/cart_item_view.dart';

popupCart([BuildContext? context]) {
  context ??= navigator.context;
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    useSafeArea: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.7,
    ),
    isScrollControlled: true,
    builder: (context) => const _CartView(
      key: Key('cart'),
    ),
  );
}

class _CartView extends StatelessWidget {
  const _CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseWidget<CartViewModel>(
      model: Provider.of<CartViewModel>(context),
      builder: (context, controller, _) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Shop Cart'),
          titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Iconsax.arrow_down_1, size: 20),
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.cartItems.isEmpty ? 0 : 1,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(64),
              child: Lottie.asset(drawable.emptyCart),
            ),
            ListViewBuilder.vertical(
              items: controller.cartItems,
              spacing: const EdgeInsets.all(16),
              itemSpacing: 8,
              builder: (item, i) => CartItemView(
                key: ValueKey(item.product.id),
                item: item,
                onRemove: (item) => controller.removeFromCart(item, i),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Button(
          label: 'Checkout (${controller.totalItems})',
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
      ),
    );
  }
}
