import 'package:flutter/material.dart';
import '../../../models/user/address_model.dart';
import '../../../shared/colors.dart';
import '../../../widgets/clipper_widget.dart';

class AddressItem extends StatelessWidget {
  final Address value;
  final Address? groupValue;
  final bool _isSelected;
  final Function(Address)? onSelect;

  const AddressItem({
    super.key,
    required this.value,
    this.groupValue,
    this.onSelect,
  }) : _isSelected = value == groupValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onSelect?.call(value),
      child: Clipper(
        radius: 12,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        color: _isSelected ? theme.colorScheme.secondary : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value.label ?? '',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                height: 1,
                color: _isSelected ? ColorPalette.light().headline : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value.address ?? '',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                height: 1,
                color: _isSelected ? ColorPalette.light().subtitle : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
