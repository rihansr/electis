import 'package:flutter/material.dart';

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
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      trailing: TextButton(
        onPressed: onAction,
        style: TextButton.styleFrom(
          foregroundColor: theme.hintColor,
          overlayColor: Colors.transparent,
        ),
        child: Text(actionLabel ?? "Show all"),
      ),
    );
  }
}
