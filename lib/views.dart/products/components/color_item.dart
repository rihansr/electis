import 'package:flutter/material.dart';
import '../../../widgets/clipper_widget.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final double size;

  const ColorItem({
    super.key,
    required this.color,
    this.isSelected = false,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? theme.textTheme.headlineLarge!.color!
              : theme.disabledColor,
        ),
      ),
      child: Clipper.circle(
        size: size,
        margin: const EdgeInsets.all(4),
        color: color,
      ),
    );
  }
}
