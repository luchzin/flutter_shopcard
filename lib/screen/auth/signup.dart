import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';

import 'package:redux/redux.dart';
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';

class SignupForm extends StatefulWidget {
  final Store<AppState> store;
  const SignupForm({super.key, required this.store});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _obscureText = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final store = widget.store;

      // Dispatch signup action (you'll need to implement this)
      store.dispatch(SignupAction(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ));
    if (mounted && store.state.auth.isSignedIn) {
      context.go('/');
    }

      // If successful, router will automatically redirect
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.blue[300],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: Colors.blue[400],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegex =
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIconColor: Colors.blue[300],
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              prefixIconColor: Colors.blue[300],
              prefixIcon: const Icon(Icons.confirmation_num),
              labelText: 'Confirm password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }),
            ),
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomLeft,
            child: StoreConnector<AppState, AuthState>(
                builder: (context, auth) {
                  if (auth.error != null) {
                    return SizedBox(
                      height: 20,
                      child: Text(
                        auth.error.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  }

                  return const SizedBox(
                    height: 0,
                    child: Text(''),
                  );
                },
                converter: (store) => store.state.auth),
          ),
          const SizedBox(height: 10),
          StoreConnector<AppState, bool>(
              builder: (context, isloading) {
                return isloading
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: _submit,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(16)),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: Text(
                              'Signup',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                          ),
                        ),
                      );
              },
              converter: (store) => store.state.auth.isLoading)
        ],
      ),
    );
  }
}
