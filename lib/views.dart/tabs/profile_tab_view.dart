import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configs/app_settings.dart';
import '../../models/user/user_model.dart';
import '../../shared/enums.dart';
import '../../shared/extensions.dart';
import '../../shared/strings.dart';
import '../../viewmodels/account_viewmodel.dart';
import '../../viewmodels/base_viewmodel.dart';
import '../../viewmodels/dashboard_viewmodel.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<AccountViewModel>.value(
      value: Provider.of<AccountViewModel>(context),
      child: Consumer<AccountViewModel>(
        builder: (context, model, child) => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(0),
          children: [
            CupertinoFormSection.insetGrouped(
              key: const ValueKey('settings_inset_group_1'),
              backgroundColor: theme.scaffoldBackgroundColor,
              children: [
                ListTile(
                  key: const ValueKey('settings_my_account'),
                  contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                  leading: CircleAvatar(
                    radius: 24,
                    child: Text(
                      model.user.fullName.firstLetter,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  title: Text(model.user.fullName),
                  titleTextStyle: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                  subtitle: Text(model.user.email ?? ''),
                ),
                ListTile(
                  key: const ValueKey('settings_my_subscription'),
                  title: Text(string.member),
                  trailing: Text(
                    'Platinum',
                    style: theme.listTileTheme.subtitleTextStyle
                        ?.copyWith(height: 1),
                  ),
                )
              ],
            ),
            CupertinoFormSection.insetGrouped(
              key: const ValueKey('language_inset_gourp'),
              backgroundColor: theme.scaffoldBackgroundColor,
              header: Text(string.language),
              children: Language.values
                  .map(
                    (language) => RadioListTile(
                      key: ValueKey(language),
                      title: Text(language.displayName),
                      value: language.locale.languageCode,
                      groupValue: appSettings.language.languageCode,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      activeColor: theme.colorScheme.primary,
                      onChanged: (_) {
                        appSettings.language = language.locale;
                        provider<DashboardViewModel>(context: context).notify;
                      },
                    ),
                  )
                  .toList(),
            ),
            CupertinoFormSection.insetGrouped(
              key: const ValueKey('theme_inset_gourp'),
              backgroundColor: theme.scaffoldBackgroundColor,
              header: Text(string.thememode),
              children: ThemeMode.values
                  .map(
                    (mode) => RadioListTile(
                      key: ValueKey(mode),
                      title: Text(mode.name.capitalize),
                      value: mode,
                      groupValue: appSettings.theme,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      activeColor: theme.colorScheme.primary,
                      onChanged: (_) => appSettings.theme = mode,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
