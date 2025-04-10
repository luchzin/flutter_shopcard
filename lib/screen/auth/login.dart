import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:shopcard/config/redux/action.dart';
import 'package:shopcard/config/redux/redux.dart';

class LoginForm extends StatefulWidget {
  final Store<AppState> store;
  const LoginForm({super.key, required this.store});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      // final store = StoreProvider.of<AuthState>(context);
      // Dispatch login action (you'll need to implement this)
      widget.store.dispatch(LoginAction(
        email: _emailController.text,
        password: _passwordController.text,
      ));
      // If successful, router will automatically redirect
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    } finally {
      if (mounted) {
        // setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: Colors.blue[300],
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
          const SizedBox(
            height: 20,
          ),
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
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomLeft,
            child: StoreConnector<AppState, AuthState>(
                builder: (context, isloading) {
                  if (isloading.error != null) {
                    return SizedBox(
                      height: 20,
                      child: Text(
                        isloading.error.toString(),
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
                              'Login',
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
