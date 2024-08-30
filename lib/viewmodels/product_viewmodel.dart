import 'package:flutter/material.dart';
import '../models/cart/cart_item_model.dart';
import '../models/product/attribute_model.dart';
import '../models/product/attribute_option_model.dart';
import '../models/product/product_model.dart';
import '../shared/extensions.dart';
import 'base_viewmodel.dart';
import 'cart_viewmodel.dart';
import 'favourites_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  final BuildContext context;
  final Product product;

  ProductViewModel(this.context, this.product);

  Map<Attribute, List<AttributeOption>> selectedOptions = {};
  set selectedOption(MapEntry<Attribute, List<AttributeOption>> value) {
    selectedOptions[value.key] = value.value;
    notifyListeners();
  }

  int get cartItems =>
      provider<CartViewModel>(context: context, listen: true).totalItems;

  addToCart() {
    List<AttributeOption> options =
        selectedOptions.values.expand((element) => element).toList();
    final cartItem = CartItem(
      id: extension.uuid,
      product: product,
      options: options,
      quantity: 1,
    );
    provider<CartViewModel>(context: context).addToCart(cartItem);
  }

  bool get isFavourite =>
      provider<FavouritesViewModel>(context: context, listen: true)
          .isFavourite(product);

  markAsFavourite() =>
      provider<FavouritesViewModel>(context: context).toogleFavourite(product);
}
