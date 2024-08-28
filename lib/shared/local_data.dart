import '../models/address_model.dart';
import '../models/category_model.dart';
import '../models/user_model.dart';

final local = Local.value;

class Local {
  static Local get value => Local._();
  Local._();

  final User user = User(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    gender: 'male',
    email: 'johndoe@example.com',
    phone: '+1234567890',
    image: 'assets/images/user.png',
    role: 'user',
    address: addresses.first,
    addresses: addresses,
  );

  final List<Category> categories = const [
    Category(id: 1, name: 'Promo', slug: 'promo'),
    Category(id: 2, name: 'Best Deals', slug: 'best_deals'),
    Category(id: 3, name: 'Windy Basic', slug: 'new_arrivals'),
    Category(id: 4, name: 'New Arrivals', slug: 'new_arrivals'),
    Category(id: 5, name: 'Trending', slug: 'trending'),
  ];

  final List<Category> filterBy = const [
    Category(id: 1, name: 'Latest', slug: 'latest'),
    Category(id: 2, name: 'Popular', slug: 'popular'),
    Category(id: 3, name: 'Top Deals', slug: 'top_deals'),
  ];
}

const List<Address> addresses = [
  Address(
    id: 1,
    label: 'Office',
    address: '456 Park Avenue, New York, USA',
    latitude: 40.7128,
    longitude: -74.0060,
  ),
  Address(
    id: 2,
    label: 'Home',
    address: '123 Main Street, New York, USA',
    latitude: 40.7128,
    longitude: -74.0060,
  ),
  Address(
    id: 3,
    label: 'Village',
    address: '789 Elm Street, New York, USA',
    latitude: 40.7128,
    longitude: -74.0060,
  ),
];
