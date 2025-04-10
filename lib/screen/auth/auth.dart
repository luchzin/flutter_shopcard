import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shopcard/config/redux/redux.dart';
import 'package:shopcard/screen/auth/login.dart';
import 'package:shopcard/screen/auth/signup.dart';

class AuthScreen extends StatefulWidget {
  final Store<AppState> store;
  const AuthScreen({super.key, required this.store});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _showLogin = true;

  void _toggleAuthMode() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Background image
        SizedBox.expand(
          child: Image.asset(
            'assets/img/shopping.png',
            fit: BoxFit.cover,
          ),
        ),

        // Gradient overlay
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(136, 162, 160, 160), // Darker overlay at bottom
                Colors.transparent,
              ],
            ),
          ),
        ),

        // Content
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Logo and title
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset('assets/img/applogo.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Shoer.kh',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Auth form
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          _showLogin
                              ? LoginForm(store: widget.store)
                              : SignupForm(store: widget.store),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: _toggleAuthMode,
                            child: Text(
                              _showLogin
                                  ? 'Create new account'
                                  : 'I already have an account',
                              style:const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
