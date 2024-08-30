import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product/product_model.dart';
import '../shared/constants.dart';
import '../shared/enums.dart';
import '../shared/styles.dart';
import 'base_viewmodel.dart';

class FavouritesViewModel extends BaseViewModel {
  final BuildContext context;

  FavouritesViewModel(this.context)
      : _favourites = Hive.box<Product>(kFavouritesTable).values.toList();

  Box<Product> get favouritesTable => Hive.box<Product>(kFavouritesTable);

  late List<Product> _favourites;
  List<Product> get favourites => _favourites;
  set favourites(List<Product> product) => this
    .._favourites = product
    ..notify;

  bool isFavourite(Product product) => _productAt(product) != -1;

  void toogleFavourite(Product product) {
    final index = _productAt(product);
    if (index != -1) {
      removeFromFavourites(product, index);
    } else {
      saveAsFavourite(product);
    }
  }

  void saveAsFavourite(Product product) {
    final index = _productAt(product);
    if (index == -1) {
      this
        ..favouritesTable.add(product)
        .._favourites.add(product)
        ..notify;

      style.snackbar('Saved as favourites', type: AlertType.success);
    }
  }

  int _productAt(Product item) => _favourites.indexWhere((x) => x == item);

  void removeFromFavourites(Product product, [int? at]) {
    final index = at ?? _productAt(product);
    if (index != -1) {
      this
        .._favourites.removeAt(index)
        ..favouritesTable.deleteAt(index)
        ..notify;
      style.snackbar('Removed from favourites', type: AlertType.error);
    }
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
