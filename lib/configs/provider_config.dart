import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/account_viewmodel.dart';
import '../viewmodels/cart_viewmodel.dart';

List<SingleChildWidget> providers = [
  ...independentService,
  ...universalService,
];

List<SingleChildWidget> independentService = [];

List<SingleChildWidget> universalService = [
  ChangeNotifierProvider<CartViewModel>(
    create: (context) => CartViewModel(),
  ),
  ChangeNotifierProvider<AccountViewModel>(
    create: (context) => AccountViewModel(),
  ),
];
