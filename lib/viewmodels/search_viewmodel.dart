import 'package:flutter/material.dart';
import '../models/product/product_model.dart';
import '../shared/local_data.dart';
import 'base_viewmodel.dart';

class SearchViewModel extends BaseViewModel {
  final TextEditingController searchController;

  SearchViewModel() : searchController = TextEditingController();

  final List<Product> _products = local.products;
  List<Product> searchedProducts = const [];

  /// Initializes the search functionality.
  ///
  /// This method adds a listener to the [searchController] to listen for changes
  /// in the search text and trigger the search operation.
  void init() {
    searchController.addListener(() {
      search();
    });
  }

  /// Performs a search operation.
  ///
  /// If a [query] is provided, it will be used as the search query.
  /// Otherwise, the search query will be obtained from the [searchController].
  ///
  /// The search query is trimmed and compared with the names of the products.
  /// The matching products are added to the [searchedProducts] list.
  ///
  /// If the search query is empty, the [searchedProducts] list will be cleared.
  ///
  /// After the search operation, the listeners will be notified of the changes.
  void search([String? query]) {
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
