import 'dart:convert';

class Address {
  const Address({
    this.id,
    this.label,
    this.address,
    this.latitude,
    this.longitude,
  });

  final int? id;
  final String? label;
  final String? address;
  final num? latitude;
  final num? longitude;

  Address copyWith({
    int? id,
    int? userId,
    String? label,
    String? address,
    num? latitude,
    num? longitude,
  }) {
    return Address(
      id: id ?? this.id,
      label: label ?? this.label,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'],
      label: map['label'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
