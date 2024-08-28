import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/address_model.dart';
import '../models/cart_item_model.dart';
import '../models/cart_model.dart';
import '../models/category_model.dart';
import '../models/date_time_adapter.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../shared/constants.dart';
import '../shared/shared_prefs.dart';

enum _AppMode { debug, production }

final appConfig = AppConfig.value;

class AppConfig {
  static AppConfig get value => AppConfig._();
  AppConfig._();
  var appMode = kDebugMode ? _AppMode.debug : _AppMode.production;
  bool isPermissionGranted = false;

  init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
      sharedPrefs.init(),
      _hiveBoxInitialize(),
    ]);
  }

  Future<void> _hiveBoxInitialize() async {
    await getApplicationDocumentsDirectory().then((dir) => Hive.init(dir.path));

    Hive
      ..registerAdapter(CartAdapter())
      ..registerAdapter(DateTimeAdapter(), override: true, internal: true)
      ..registerAdapter(UserAdapter())
      ..registerAdapter(AddressAdapter())
      ..registerAdapter(CartItemAdapter())
      ..registerAdapter(ProductAdapter())
      ..registerAdapter(CategoryAdapter());

    await Hive.openBox<Cart>(kCartTable);
  }
}
