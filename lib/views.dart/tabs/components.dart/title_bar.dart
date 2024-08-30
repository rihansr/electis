import 'package:flutter/material.dart';
import '../../../shared/strings.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final Function()? onAction;
  const TitleBar({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(title),
      titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      trailing: TextButton(
        onPressed: onAction,
        style: TextButton.styleFrom(
          foregroundColor: theme.hintColor,
          overlayColor: Colors.transparent,
        ),
        child: Text(actionLabel ?? string.showAll),
      ),
    );
  }
}
