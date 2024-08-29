import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/category/category_model.dart';
import '../models/product/attribute_option_model.dart';
import '../models/product/product_model.dart';
import '../shared/local_data.dart';
import 'base_viewmodel.dart';

class ProductsViewModel extends BaseViewModel {
  final BuildContext context;
  final Category? _category;
  late Category? _tag;

  ProductsViewModel(this.context, {Category? category, Category? tag})
      : _category = category,
        _tag = tag;

  List<Product> _products = const [];
  List<Product> filterdProducts = const [];

  List<Category> tags = local.tags;
  List<AttributeOption> sortOptions = local.sortBy;

  AttributeOption? _sortBy;
  AttributeOption? get sortBy => _sortBy;
  set sortBy(AttributeOption? by) => this
    .._sortBy = by
    .._sort()
    ..notifyListeners();

  Category? get tag => _tag;
  set tag(Category? tag) => this
    .._tag = tag
    .._filter()
    .._sort()
    ..notifyListeners();

  init() {
    _products = _category == null
        ? local.products
        : local.products
            .where((product) => product.categories.contains(_category))
            .toList();
    _filter();
  }

  _filter() {
    filterdProducts = _tag == null
        ? _products
        : _products.where((product) {
            switch (_tag?.slug) {
              case 'latest':
                return product.isNew;
              case 'popular':
                return product.isPopular;
              case 'top_deals':
                return product.topDeals;
              default:
                return false;
            }
          }).toList();
  }

  popupSortOptions() => showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
            title: const Text('Sort by'),
            actions: sortOptions
                .map(
                  (option) => CupertinoActionSheetAction(
                    onPressed: () {
                      sortBy = option;
                      context.pop();
                    },
                    child: Text(
                      option.name ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
                .toList(),
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => context.pop(),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
          ));

  _sort() {
    switch (_sortBy?.slug) {
      case 'price_high_to_low':
        filterdProducts.sort((a, b) => a.price.compareTo(b.price));
      case 'price_low_to_high':
        filterdProducts.sort((a, b) => b.price.compareTo(a.price));
      case 'price_a_to_z':
        filterdProducts.sort((a, b) => a.name.compareTo(b.name));
      case 'price_z_to_a':
        filterdProducts.sort((a, b) => b.name.compareTo(a.name));
      case 'top_rated':
        filterdProducts.sort((a, b) => b.rating.compareTo(a.rating));
    }
  }
}
