import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../shared/drawables.dart';

class FeedsTabView extends StatelessWidget {
  const FeedsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Lottie.asset(drawable.empty, height: 128),
    );
  }
}
