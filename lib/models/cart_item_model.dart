import 'package:hive/hive.dart';
import 'product_model.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 4)
class CartItem {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final Product product;
  @HiveField(2)
  final int quantity;

  CartItem({
    this.id,
    this.product = const Product(),
    this.quantity = 1,
  });

  CartItem copyWith({
    int? id,
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      product: map['product'] == null
          ? const Product()
          : Product.fromMap(map['product']),
      quantity: map['quantity'] ?? 1,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
