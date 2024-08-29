import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/category/category_model.dart';
import '../services/navigation_service.dart';
import '../views.dart/all_products_view.dart';
import '../views.dart/landing_view.dart';
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
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
);
