import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/cart_viewmodel.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../viewmodels/favourites_viewmodel.dart';

List<SingleChildWidget> providers = [
  ...independentService,
  ...universalService,
];

List<SingleChildWidget> independentService = [];

List<SingleChildWidget> universalService = [
   ChangeNotifierProvider<DashboardViewModel>(
    create: (context) => DashboardViewModel(),
  ),
  ChangeNotifierProvider<AccountViewModel>(
    create: (context) => AccountViewModel(),
  ),
  ChangeNotifierProvider<CartViewModel>(
    create: (context) => CartViewModel(context),
  ),
  ChangeNotifierProvider<FavouritesViewModel>(
    create: (context) => FavouritesViewModel(context),
  ),
];
