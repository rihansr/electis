import 'package:flutter/material.dart';

import '../models/product/product_model.dart';
import '../shared/local_data.dart';
import 'base_viewmodel.dart';

class SearchViewModel extends BaseViewModel {
  final TextEditingController searchController;

  SearchViewModel() : searchController = TextEditingController();

  final List<Product> _products = local.products;
  List<Product> searchedProducts = const [];

  init() {
    searchController.addListener(() {
      search();
    });
  }

  search([String? query]) {
    query ??= searchController.text;
    query = query.trim();
    searchedProducts = query.isEmpty
        ? []
        : _products.where((product) {
            final name = product.name.toLowerCase();
            final queryLower = query?.toLowerCase() ?? '';
            return name.contains(queryLower);
          }).toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
