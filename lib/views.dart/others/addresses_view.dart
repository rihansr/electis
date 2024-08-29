import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/account_viewmodel.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/listview_builder.dart';
import '../tabs/components.dart/title_bar.dart';
import 'components/address_item.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseWidget<AccountViewModel>(
      model: Provider.of<AccountViewModel>(context),
      builder: (context, controller, _) => Dialog(
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: theme.scaffoldBackgroundColor,
        alignment: Alignment.topCenter,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SafeArea(child: SizedBox(height: 8)),
              Row(
                children: [
                  const SizedBox(width: 16),
                  const Expanded(
                    child: _ChipItem(
                      key: Key('balance_chip_key'),
                      title: 'BALANCE',
                      subtitle: 'RP 2500.000',
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: _ChipItem(
                      key: Key('member_chip_key'),
                      title: 'MEMBER',
                      subtitle: 'Platinum',
                      trailing: Iconsax.cup,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const TitleBar(
                title: 'Delivery Location',
                actionLabel: 'Manage',
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: theme.disabledColor,
                elevation: 2,
                child: ListViewBuilder.vertical(
                  shrinkWrap: true,
                  items: controller.user.addresses,
                  spacing: const EdgeInsets.all(8),
                  builder: (address, index) => AddressItem(
                    key: ValueKey(index),
                    value: address,
                    groupValue: controller.address,
                    onSelect: (item) => controller.address = item,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? trailing;
  const _ChipItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: theme.disabledColor,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      title: Text(
        title.toUpperCase(),
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
      trailing: trailing != null
          ? Align(
              widthFactor: 0,
              alignment: Alignment.bottomRight,
              child: Icon(
                trailing,
                size: 16,
                color: Colors.amber,
              ),
            )
          : null,
    );
  }
}
