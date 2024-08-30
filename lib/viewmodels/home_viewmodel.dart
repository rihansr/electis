import '../models/other/banner_model.dart' as slider;
import '../models/category/category_model.dart';
import '../models/product/product_model.dart';
import '../shared/local_data.dart';
import 'base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  List<Category> categories = local.categories;

  List<slider.Banner> banners = local.banners;

  List<Product> products = local.products;

  List<Product> newArrivals = const [];

  List<Product> topDeals = const [];

  List<Product> popularProducts = const [];

  /// Sets the new arrivals, top deals, and popular products based on the
  /// products list.
  void setProducts() {
    List<Product> newArrivals = [];
    List<Product> topDeals = [];
    List<Product> popularProducts = [];
    for (var product in products) {
      if (product.isNew) newArrivals.add(product);
      if (product.topDeals) topDeals.add(product);
      if (product.isPopular) popularProducts.add(product);
    }
    this.newArrivals = newArrivals;
    this.topDeals = topDeals;
    this.popularProducts = popularProducts;
  }

  final List<Product> _products = local.products;

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? catergory) => this
    .._selectedCategory = catergory
    ..products = catergory == null
        ? _products
        : _products
            .where((product) => product.categories.contains(catergory))
            .toList()
    ..setProducts()
    ..notify;
}
