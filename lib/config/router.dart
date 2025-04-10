import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:shopcard/config/redux/redux.dart';
import 'package:shopcard/screen/auth/auth.dart';
import 'package:shopcard/screen/home.dart';

GoRouter router(Store<AppState> store) {
  return GoRouter(
      refreshListenable: ReduxRefreshListenable(store),
      initialLocation: '/',
      //  refreshListenable: _ReduxRefreshListenable(store),
      redirect: (BuildContext context, GoRouterState state) {
        // If not signed in and not going to signin page, redirect to signin
        if (!store.state.auth.isSignedIn && state.fullPath != '/auth') {
          return '/auth';
        }

        // If signed in and trying to access signin page, redirect to home
        if (store.state.auth.isSignedIn && state.fullPath == '/auth') {
          return '/';
        }

        return null; // No redirect
      },
      routes: [
        // StatefulShellRoute(branches: branches, navigatorContainerBuilder: navigatorContainerBuilder)
        GoRoute(path: '/', builder: (context, state) => const Home()),
        GoRoute(
            path: '/auth',
            builder: (context, state) => AuthScreen(store: store)),
      ]);
}

class ReduxRefreshListenable extends ChangeNotifier {
  final Store<AppState> store;
  late final StreamSubscription _subscription;

  ReduxRefreshListenable(this.store) {
    _subscription = store.onChange.listen((state) {
    
        notifyListeners();
      
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
