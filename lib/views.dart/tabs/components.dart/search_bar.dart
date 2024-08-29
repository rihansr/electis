import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/strings.dart';
import '../../search_view.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (context) => const SearchProductsView(),
      ),
      dense: true,
      shape: const StadiumBorder(),
      tileColor: theme.disabledColor,
      contentPadding: const EdgeInsets.all(6),
      visualDensity: const VisualDensity(
        vertical: -4,
        horizontal: -4,
      ),
      minLeadingWidth: 0,
      leading: CircleAvatar(
        backgroundColor: theme.primaryColor,
        child: const Icon(
          Iconsax.search_normal_1,
          color: Colors.white,
          size: 18,
        ),
      ),
      title: Text(string.searchHint),
      subtitle: Text(string.searchSubtitle),
    );
  }
}
