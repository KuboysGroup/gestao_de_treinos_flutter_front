import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/config/router/routes.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_state.g.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

GoRouter? _previousRouter;

@riverpod
GoRouter routerState(Ref ref) {
  final AsyncValue<Usuario?> usuario = ref.watch(usuarioStateProvider);
  return _previousRouter = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation:
        _previousRouter?.routerDelegate.currentConfiguration.fullPath,
    routes: router,
    redirect: (context, state) async {
      return usuario.when(
        data: (data) {
          final loggingIn = state.matchedLocation == '/login';
          if (data == null) {
            return loggingIn ? null : '/login';
          } else {
            return loggingIn ? '/' : null;
          }
        },
        error: (error, stackTrace) {
          return '/login';
        },
        loading: () {
          return null;
        },
      );
    },
  );
}
