class Banner {
  final int? id;
  final String? image;

  Banner({
    this.id,
    this.image,
  });

  Banner copyWith({
    int? id,
    String? image,
  }) {
    return Banner(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Banner && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
