import '../models/user/address_model.dart';
import '../models/product/attribute_model.dart';
import '../models/product/attribute_option_model.dart';
import '../models/other/banner_model.dart';
import '../models/category/category_model.dart';
import '../models/product/product_model.dart';
import '../models/user/user_model.dart';

final User user = User(
  id: 1,
  firstName: 'John',
  lastName: 'Doe',
  gender: 'male',
  email: 'johndoe@example.com',
  phone: '+1234567890',
  image: 'assets/images/user.png',
  role: 'user',
  address: addresses[0],
  addresses: addresses,
);

const List<Category> categories = [
  Category(id: 1, name: 'Promo', slug: 'promo'),
  Category(id: 2, name: 'Best Deals', slug: 'best_deals'),
  Category(id: 3, name: 'Windy Basic', slug: 'new_arrivals'),
  Category(id: 4, name: 'New Arrivals', slug: 'new_arrivals'),
  Category(id: 5, name: 'Trending', slug: 'trending'),
];

const List<Banner> banners = [
  Banner(id: 1, image: 'assets/images/banner_1.jpg'),
  Banner(id: 2, image: 'assets/images/banner_2.jpg'),
  Banner(id: 3, image: 'assets/images/banner_3.jpg'),
];

const List<Product> products = [
  Product(
    id: 1,
    name: 'Sony Alpha 9 Mark III',
    image: 'assets/images/camera.png',
    price: 24500,
    rating: 4.9,
    isNew: true,
    topDeals: true,
    attributes: [
      Attribute(
        name: 'Color',
        slug: 'color',
        options: [
          AttributeOption(name: '#FF000000', slug: 'black'),
          AttributeOption(name: '#FFC0C0C0', slug: 'gray'),
        ],
      ),
    ],
    categories: categories,
  ),
  Product(
    id: 2,
    name: 'Edifiers Headphone',
    image: 'assets/images/headphone.png',
    price: 1099,
    rating: 4.8,
    isPopular: true,
    topDeals: true,
    attributes: [
      Attribute(
        name: 'Color',
        slug: 'color',
        options: [
          AttributeOption(name: '#FF000000', slug: 'black'),
          AttributeOption(name: '#FFFFFFFF', slug: 'gray'),
        ],
      ),
    ],
    categories: categories,
  ),
  Product(
    id: 3,
    name: 'Marshall Action 3',
    image: 'assets/images/speaker.png',
    price: 5400,
    rating: 4.8,
    isPopular: true,
    attributes: [
      Attribute(
        name: 'Color',
        slug: 'color',
        options: [
          AttributeOption(name: '#FFFAF0E6', slug: 'yellow'),
          AttributeOption(name: '#FF000000', slug: 'black'),
        ],
      ),
    ],
    categories: categories,
  ),
  Product(
    id: 4,
    name: 'Meta Vision Ultra',
    image: 'assets/images/vr_headset.png',
    price: 8600,
    rating: 4.7,
    isNew: true,
    topDeals: true,
    attributes: [
      Attribute(
        name: 'Color',
        slug: 'color',
        options: [
          AttributeOption(name: '#FFFFFFFF', slug: 'gray'),
          AttributeOption(name: '#FF000000', slug: 'black'),
        ],
      ),
    ],
    categories: categories,
  ),
];

const List<Category> filterBy = [
  Category(id: 1, name: 'Latest', slug: 'latest'),
  Category(id: 2, name: 'Popular', slug: 'popular'),
  Category(id: 3, name: 'Top Deals', slug: 'top_deals'),
];

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
