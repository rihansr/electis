import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/navigation_service.dart';
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
   /*  GoRoute(
      name: Routes.messages,
      path: '/${Routes.messages}/:gourp_chat_id',
      builder: (BuildContext context, GoRouterState state) {
        String? id = state.pathParameters['gourp_chat_id'];
        return id == null ? const SizedBox() : ChatView(groupChatId: id);
      },
    ),
    GoRoute(
      name: Routes.profile,
      path: '/:username',
      builder: (BuildContext context, GoRouterState state) {
        String? uid = state.pathParameters['username'];
        return uid == null ? const SizedBox() : ProfileView(username: uid);
      },
    ), */
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  ),
);
