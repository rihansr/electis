import 'dart:convert';
import 'address_model.dart';

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? gender;
  final String? image;
  final String? role;
  final Address? address;
  final List<Address> addresses;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
    this.image,
    this.role,
    this.address,
    this.addresses = const [],
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? gender,
    String? image,
    String? role,
    DateTime? createdAt,
    Address? address,
    List<Address>? addresses,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      role: role ?? this.role,
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      image: map['image'],
      role: map['role'],
      address: map['address'] == null ? null : Address.fromMap(map['address']),
      addresses: List<Address>.from(
        map['addresses']?.map((x) => Address.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'image': image,
      'role': role,
      'address': address!.toMap(),
      'addresses': List<dynamic>.from(addresses.map((x) => x.toMap())),
    };
  }
  
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

extension UserExtension on User {
  String get fullName => '$firstName $lastName'.trim();
}
