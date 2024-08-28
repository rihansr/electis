import 'package:flutter/material.dart';
import '../../widgets/button_widget.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button(
          label: 'Button',
        )
      ],
    );
  }
}
