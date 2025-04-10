// Reducer function
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';

AppTheme themeReducer(AppTheme state, dynamic action) {
  if (action is ChangeThemeAction) {
    return state.copyWith(
      name: action.theme,
    );
  }
  return state;
}

AuthState authReducer(AuthState state, dynamic action) {
  switch (action) {
    case AuthSuccessAction _:
      return state.copyWith(isSignedIn: true, isLoading: false, error: null);
    case AuthFailureAction _:
      return state.copyWith(
          isSignedIn: false, isLoading: false, error: action.error);
    case LogoutAction _:
      return state.copyWith(isSignedIn: false, error: null, isLoading: false);
    case LoadingAuthAction _:
      return state.copyWith(isSignedIn: false, isLoading: true, error: null);

    case _:
      return state;
  }
}
