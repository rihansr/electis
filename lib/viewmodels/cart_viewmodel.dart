import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/cart/cart_item_model.dart';
import '../shared/constants.dart';
import '../shared/enums.dart';
import '../shared/strings.dart';
import '../shared/styles.dart';
import 'base_viewmodel.dart';

class CartViewModel extends BaseViewModel {
  /// The [BuildContext] associated with the cart view.
  final BuildContext context;

  /// Constructs a new instance of [CartViewModel] with the given [context].
  CartViewModel(this.context)
      : _cartItems = Hive.box<CartItem>(kCartTable).values.toList();

  /// Gets the [Box] representing the cart table in Hive.
  Box<CartItem> get cartTable => Hive.box<CartItem>(kCartTable);

  /// The list of cart items.
  late List<CartItem> _cartItems;
  List<CartItem> get cartItems => _cartItems;
  set cartItems(List<CartItem> value) => this
    .._cartItems = value
    ..notify;

  /// Gets the total number of items in the cart.
  int get total => _cartItems.length;

  /// Gets the total number of items in the cart, taking into account the quantity of each item.
  int get totalItems =>
      cartItems.fold(0, (total, item) => total + item.quantity);

  /// Adds the specified [cartItem] to the cart.
  ///
  /// If the item is already in the cart, it will not be added again.
  /// A success message will be displayed using a snackbar.
  void addToCart(CartItem cartItem) {
    final index = _cartItemAt(cartItem);
    if (index == -1) {
      this
        ..cartTable.add(cartItem)
        .._cartItems.add(cartItem)
        ..notify;

      ScaffoldMessenger.of(context).showSnackBar(
        style.snackbar(string.addedToCart, type: AlertType.success),
      );
    }
  }

  /// Gets the index of the specified [item] in the cart.
  ///
  /// Returns -1 if the item is not found in the cart.
  int _cartItemAt(CartItem item) => _cartItems.indexWhere((x) => x == item);

  /// Removes the specified [cartItem] from the cart.
  ///
  /// If the [at] parameter is provided, the item at the specified index will be removed.
  /// Otherwise, the item will be removed based on its index in the cart.
  /// A removal message will be displayed using a snackbar.
  void removeFromCart(CartItem cartItem, [int? at]) {
    final index = at ?? _cartItemAt(cartItem);
    if (index != -1) {
      this
        .._cartItems.removeAt(index)
        ..cartTable.deleteAt(index)
        ..notify;
      ScaffoldMessenger.of(context).showSnackBar(
        style.snackbar(string.removedFromCart, type: AlertType.error),
      );
    }
  }

  /// Close local storage when the viewmodel is disposed.
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
