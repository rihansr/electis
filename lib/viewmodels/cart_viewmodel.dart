import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/cart/cart_item_model.dart';
import '../shared/constants.dart';
import '../shared/enums.dart';
import '../shared/styles.dart';
import 'base_viewmodel.dart';

class CartViewModel extends BaseViewModel {
  final BuildContext context;

  CartViewModel(this.context)
      : _cartItems = Hive.box<CartItem>(kCartTable).values.toList();

  Box<CartItem> get cartTable => Hive.box<CartItem>(kCartTable);

  late List<CartItem> _cartItems;
  List<CartItem> get cartItems => _cartItems;
  set cartItems(List<CartItem> value) => this
    .._cartItems = value
    ..notify;

  int get total => _cartItems.length;

  int get totalItems =>
      cartItems.fold(0, (total, item) => total + item.quantity);

  void addToCart(CartItem cartItem) {
    final index = _cartItemAt(cartItem);
    if (index == -1) {
      this
        ..cartTable.add(cartItem)
        .._cartItems.add(cartItem)
        ..notify;

      style.snackbar('Added to cart', type: AlertType.success);
    }
  }

  int _cartItemAt(CartItem item) => _cartItems.indexWhere((x) => x == item);

  void removeFromCart(CartItem cartItem, [int? at]) {
    final index = at ?? _cartItemAt(cartItem);
    if (index != -1) {
      this
        .._cartItems.removeAt(index)
        ..cartTable.deleteAt(index)
        ..notify;
      style.snackbar('Removed from cart', type: AlertType.error);
    }
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
