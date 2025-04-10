import 'package:shared_preferences/shared_preferences.dart';

Future<String?> login(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();

  final savedEmail = prefs.getString('email');
  final savedPassword = prefs.getString('password');

  if (savedEmail != null &&
      savedPassword != null &&
      savedEmail == email &&
      savedPassword == password) {
    return 'Login successful';
  } else {
    return null; // Email or password does not match
  }
}


Future<bool> signup(String email, String password, String username) async {
  final prefs = await SharedPreferences.getInstance();

  // You might want to check if an account already exists
  final existingEmail = prefs.getString('email');
  if (existingEmail != null) {
    // User already signed up
    return false;
  }

  // Save the new user's data
  await prefs.setString('email', email);
  await prefs.setString('password', password);
  await prefs.setString('username', username);

  return true;
}

Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // Clears all stored keys (email, password, username)
}