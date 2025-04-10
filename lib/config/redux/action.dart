class ChangeThemeAction {
  final String theme;

  ChangeThemeAction({required this.theme});

  @override
  String toString() => 'ChangeThemeAction(theme: $theme)';
}

// auth_actions.dart
class LoginAction {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});
}

class SignupAction {
  final String email;
  final String password;
  final String username;

  SignupAction(
      {required this.email, required this.username, required this.password});
}

class AuthSuccessAction {
  final String token; // or user model if you prefer

  AuthSuccessAction(this.token);
}

class AuthFailureAction {
  final String error;

  AuthFailureAction(this.error);
}

class LogoutAction {}
class LoadingAuthAction{}