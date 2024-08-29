import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/category/category_model.dart';
import '../models/product/product_model.dart';
import '../services/navigation_service.dart';
import '../views.dart/products/all_products_view.dart';
import '../views.dart/landing_view.dart';
import '../views.dart/products/product_view.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigator.navigatorKey,
  initialLocation: Routes.landing,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.landing,
      path: Routes.landing,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingView();
      },
    ),
    GoRoute(
      name: Routes.allProducts,
      path: Routes.allProducts,
      builder: (BuildContext context, GoRouterState state) {
        final data = state.extra as Map<String, dynamic>?;
        return AllProductsView(
          category: data?['category'] as Category?,
          tag: data?['tag'] as Category?,
        );
      },
    ),
    GoRoute(
      name: Routes.product,
      path: Routes.product,
      builder: (BuildContext context, GoRouterState state) {
        final data = state.extra as Map<String, dynamic>?;
        return ProductDetailsView(
          product: (data?['product'] as Product?) ?? const Product(),
        );
      },
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
);
