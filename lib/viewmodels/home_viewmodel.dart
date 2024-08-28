import 'package:electis/shared/local_data.dart' as local;
import '../models/other/banner_model.dart' as slider;
import '../models/category/category_model.dart';
import '../models/product/product_model.dart';
import 'base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel();

  List<Category> categories = local.categories;
  List<slider.Banner> banners = local.banners;
  List<Product> products = local.products;

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? catergory) => this
    .._selectedCategory = catergory
    ..notify;
}
