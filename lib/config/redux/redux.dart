import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcard/config/redux/middleware.dart';
import 'package:shopcard/config/redux/reducer.dart';

// Action to change theme

class AppTheme {
  final String name;

  AppTheme({required this.name});

  AppTheme copyWith({String? name}) {
    return AppTheme(
      name: name ?? this.name,
    );
  }
}

class AuthState {
  final bool isSignedIn;
  final String? error;
  final bool isLoading;

  AuthState({this.error, required this.isLoading, required this.isSignedIn});

  AuthState.initial()
      : isSignedIn = false,
        error = '',
        isLoading = false;

  AuthState copyWith({bool? isSignedIn, String? error, bool? isLoading}) {
    return AuthState(
        error: error ?? this.error,
        isSignedIn: isSignedIn ?? this.isSignedIn,
        isLoading: isLoading ?? this.isLoading);
  }
}

// App state
class AppState {
  final AppTheme theme;
  final AuthState auth;

  AppState({required this.auth, required this.theme});

  // Helper method to create a copy with updated values
  AppState copyWith({AppTheme? theme, AuthState? auth}) {
    return AppState(
      theme: theme ?? this.theme,
      auth: auth ?? this.auth,
    );
  }

  @override
  String toString() => 'AppState(theme: $theme)';
}

AppState appReducer(AppState state, dynamic action) {
  // Only update if the sub-state actually changes
  final newTheme = themeReducer(state.theme, action);
  final newAuth = authReducer(state.auth, action);

  // Otherwise, return a new state with updated parts
  return AppState(
    theme: newTheme,
    auth: newAuth,
  );
}

Future<Store<AppState>> createStore() async {
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('is_logged_in') ?? false;
  final savedTheme = prefs.getString('app_theme') ?? 'light';

  return Store<AppState>(
    appReducer,
    initialState: AppState(
      theme: AppTheme(name: savedTheme),
      auth: AuthState(isSignedIn: isLoggedIn, isLoading: false),
    ),
    middleware: [
      themeMiddleware,
      authMiddleware,
    ],
  );
}
