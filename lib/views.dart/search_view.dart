import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/strings.dart';
import '../../widgets/base_widget.dart';
import '../viewmodels/search_viewmodel.dart';
import 'tabs/components.dart/product_item.dart';

class SearchProductsView extends StatelessWidget {
  const SearchProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseWidget<SearchViewModel>(
      model: SearchViewModel(),
      onInit: (controller) => controller.init(),
      onDispose: (controller) => controller.dispose(),
      builder: (context, controller, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CupertinoSearchTextField(
                
                controller: controller.searchController,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                autofocus: true,
                placeholder: string.searchHint,
                style: theme.textTheme.bodyMedium?.copyWith(height: 1),
                prefixIcon: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 16,
                  child: const Icon(
                    Iconsax.search_normal_1,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                suffixIcon: const Icon(Icons.close, size: 18),
                suffixInsets: const EdgeInsets.all(8),
                prefixInsets: const EdgeInsets.all(8),
                onSubmitted: (query) => controller.search(query),
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = controller.searchedProducts[index];
                    return ProductItem(product);
                  },
                  childCount: controller.searchedProducts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
