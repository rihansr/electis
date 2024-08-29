import 'package:flutter/material.dart';
import '../models/product/attribute_model.dart';
import '../models/product/attribute_option_model.dart';
import '../models/product/product_model.dart';
import 'base_viewmodel.dart';

class ProductViewModel extends BaseViewModel {
  final BuildContext context;
  final Product product;

  ProductViewModel(this.context, this.product);

  Map<Attribute, List<AttributeOption>> selectedOptions = {};
  set selectedOption(MapEntry<Attribute, List<AttributeOption>> value) {
    selectedOptions[value.key] = value.value;
    notifyListeners();
  }
}
