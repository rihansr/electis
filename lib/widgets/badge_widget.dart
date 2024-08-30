import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final Widget child;
  final int count;
  const Badges.count({super.key, required this.child, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      count: count,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Colors.white,
      offset: const Offset(6, -6),
      isLabelVisible: count > 0,
      child: child,
    );
  }
}
