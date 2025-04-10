import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcard/api/auth_api.dart';
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';

void authMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) async {
  // First pass the action to reducers
  next(action);

  if (action is SignupAction) {
    store.dispatch(LoadingAuthAction());
    await Future.delayed(const Duration(seconds: 2));
    final res = await signup(action.email, action.password, action.username);
    if (res) {
      store.dispatch(AuthSuccessAction(action.email));
    } else {
      store.dispatch(AuthFailureAction('please try again'));
    }
  }
  if (action is LoginAction) {
    // Simulate network delay
    store.dispatch(LoadingAuthAction());
    await Future.delayed(const Duration(seconds: 2));
    // Dispatch success action
    final res = await login(action.email, action.password);
    if (res != null) {
      store.dispatch(AuthSuccessAction(action.email));
    } else {
      // Dispatch failure action
      store.dispatch(AuthFailureAction('please try again'));
    }
  }

  if (action is LogoutAction) {
    await logout();
    // store.dispatch(LogoutAction());
  }
}

// Custom middleware to handle theme changes
void themeMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) async {
  // First let the action go through to the reducer
  next(action);

  if (action is ChangeThemeAction) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'app_theme', action.theme); // Save theme to shared preferences

    // Optionally, you can load the theme from shared preferences when the app starts
    String? savedTheme = prefs.getString('app_theme');

    // Only dispatch the action again if the theme has actually changed
    // if (savedTheme != null && savedTheme != store.state.theme) {
    //   store.dispatch(ChangeThemeAction(theme: savedTheme));
    // }
  }
}
