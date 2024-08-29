import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../widgets/base_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CartViewModel>(
      model: Provider.of<CartViewModel>(context),
      builder: (context, controller, _) => const Column(
        children: [],
      ),
    );
  }
}
