import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    ]);
  }

  Map<String, dynamic> get configs => config[appMode.name]!;

  static const config = {
    "debug": {
      "base": {
        "app_id": "com.example.glucose_tracker_app",
        "app_store_id": "6475195875"
      },
      "admob": {
        "banner_ad": {
          "android": "ca-app-pub-3940256099942544/6300978111",
          "iOS": "ca-app-pub-3940256099942544/2934735716"
        },
        "interstitial_ad": {
          "android": "ca-app-pub-3940256099942544/1033173712",
          "iOS": "ca-app-pub-3940256099942544/4411468910"
        },
        "rewarded_ad": {
          "android": "ca-app-pub-3940256099942544/5224354917",
          "iOS": "ca-app-pub-3940256099942544/1712485313"
        },
        "app_open_ad": {
          "android": "ca-app-pub-3940256099942544/3419835294",
          "iOS": "ca-app-pub-3940256099942544/5662855259"
        }
      },
      "iap": {
        "android": "goog_YFXcFKMECaNvQoroqEVAUYsoFpc",
        "iOS": "appl_meiEEaRnQYASZKNFPYhgLZbQAHw"
      },
      "other": {
        "privacy_policy": "https://techtiq.xyz/swipeme/privacy-policy/",
        "tnc": "https://techtiq.xyz/swipeme/tnc/"
      }
    },
    "production": {
      "base": {
        "app_id": "com.example.glucose_tracker_app",
        "app_store_id": "6475195875"
      },
      "admob": {
        "banner_ad": {
          "android": "ca-app-pub-5679781628301951/9132162638",
          "iOS": "ca-app-pub-5679781628301951/9017500612"
        },
        "interstitial_ad": {
          "android": "ca-app-pub-5679781628301951/2217918852",
          "iOS": "ca-app-pub-5679781628301951/8839167527"
        },
        "rewarded_ad": {
          "android": "ca-app-pub-5679781628301951/9947438905",
          "iOS": "ca-app-pub-5679781628301951/4071407645"
        },
        "app_open_ad": {
          "android": "ca-app-pub-5679781628301951/9904837182",
          "iOS": "ca-app-pub-5679781628301951/3624738980"
        }
      },
      "iap": {
        "android": "goog_YFXcFKMECaNvQoroqEVAUYsoFpc",
        "iOS": "appl_meiEEaRnQYASZKNFPYhgLZbQAHw"
      },
      "other": {
        "privacy_policy": "https://techtiq.xyz/swipeme/privacy-policy/",
        "tnc": "https://techtiq.xyz/swipeme/tnc/"
      }
    }
  };
}
