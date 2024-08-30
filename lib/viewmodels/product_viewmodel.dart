import 'package:electis/shared/extensions.dart';
import 'package:flutter/material.dart';
import '../models/cart/cart_item_model.dart';
import '../models/product/attribute_model.dart';
import '../models/product/attribute_option_model.dart';
import '../models/product/product_model.dart';
import 'base_viewmodel.dart';
import 'cart_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  final BuildContext context;
  final Product product;

  ProductViewModel(this.context, this.product);

  CartViewModel get cartProvider => provider<CartViewModel>(context: context);

  Map<Attribute, List<AttributeOption>> selectedOptions = {};
  set selectedOption(MapEntry<Attribute, List<AttributeOption>> value) {
    selectedOptions[value.key] = value.value;
    notifyListeners();
  }

  addToCart() {
    List<AttributeOption> options =
        selectedOptions.values.expand((element) => element).toList();
    final cartItem = CartItem(
      id: extension.uuid,
      product: product,
      options: options,
      quantity: 1,
    );
    cartProvider.addToCart(cartItem);
  }
}
