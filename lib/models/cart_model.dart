import 'package:hive/hive.dart';
import 'address_model.dart';
import 'cart_item_model.dart';
import 'user_model.dart';
part 'cart_model.g.dart';


@HiveType(typeId: 0)
class Cart {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final DateTime? createdAt;
  @HiveField(2)
  final User? customer;
  @HiveField(3)
  final Address? address;
  @HiveField(4)
  final List<CartItem> items;

  Cart({
    this.id,
    this.createdAt,
    this.customer,
    this.address,
    this.items = const [],
  });

  Cart copyWith({
    int? id,
    DateTime? createdAt,
    User? customer,
    Address? address,
    List<CartItem>? items,
  }) {
    return Cart(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      customer: customer ?? this.customer,
      address: address ?? this.address,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'customer': customer?.toMap(),
      'address': address?.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'],
      createdAt:
          map['created_at'] == null ? null : DateTime.parse(map['created_at']),
      customer: map['customer'] == null ? null : User.fromMap(map['customer']),
      address: map['address'] == null ? null : Address.fromMap(map['address']),
      items: List<CartItem>.from(
        map['items']?.map((x) => CartItem.fromMap(x)) ?? [],
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cart && other.id == id;
  }

  @override
  int get hashCode {
    return createdAt.hashCode;
  }
}
