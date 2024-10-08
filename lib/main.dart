import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'configs/app_configs.dart';
import 'configs/app_settings.dart';
import 'configs/provider_config.dart';
import 'configs/theme_config.dart';
import 'routing/route_generator.dart';
import 'services/navigation_service.dart';

Future<void> main() async =>
    appConfig.init().then((_) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: providers,
      child: ValueListenableBuilder(
        valueListenable: appSettings.settings,
        builder: (_, settings, __) => MaterialApp.router(
          title: 'Electis',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: navigator.scaffoldMessengerKey,
          themeMode: settings.themeMode,
          theme: theming(ThemeMode.light),
          darkTheme: theming(ThemeMode.dark),
          locale: settings.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
  }
}
