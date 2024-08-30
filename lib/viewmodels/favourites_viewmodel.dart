import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product/product_model.dart';
import '../shared/constants.dart';
import '../shared/enums.dart';
import '../shared/strings.dart';
import '../shared/styles.dart';
import 'base_viewmodel.dart';

class FavouritesViewModel extends BaseViewModel {
  final BuildContext context;

  FavouritesViewModel(this.context)
      : _favourites = Hive.box<Product>(kFavouritesTable).values.toList();

  // Get the favourites table from local database
  Box<Product> get favouritesTable => Hive.box<Product>(kFavouritesTable);

  // Define the _favourites list
  late List<Product> _favourites;
  List<Product> get favourites => _favourites;
  set favourites(List<Product> product) => this
    .._favourites = product
    ..notify;

  // Check if a product is in the favourites list
  bool isFavourite(Product product) => _productAt(product) != -1;

  // Toggle the favourite status of a product
  void toogleFavourite(Product product) {
    final index = _productAt(product);
    if (index != -1) {
      removeFromFavourites(product, index);
    } else {
      saveAsFavourite(product);
    }
  }

  // Save a product as a favourite
  void saveAsFavourite(Product product) {
    final index = _productAt(product);
    if (index == -1) {
      this
        ..favouritesTable.add(product)
        .._favourites.add(product)
        ..notify;

      ScaffoldMessenger.of(context).showSnackBar(
        style.snackbar(string.savedAsFavorite, type: AlertType.success),
      );
    }
  }

  // Get the index of a product in the favourites list
  int _productAt(Product item) => _favourites.indexWhere((x) => x == item);

  // Remove a product from the favourites list
  void removeFromFavourites(Product product, [int? at]) {
    final index = at ?? _productAt(product);
    if (index != -1) {
      this
        .._favourites.removeAt(index)
        ..favouritesTable.deleteAt(index)
        ..notify;
      ScaffoldMessenger.of(context).showSnackBar(
        style.snackbar(string.removedFromFavorite, type: AlertType.error),
      );
    }
  }

  // Dispose the Hive instance when the view model is disposed
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
