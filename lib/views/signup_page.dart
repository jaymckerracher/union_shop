import '../utils/firebase_check_user.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'app_drawer.dart';
import '../utils/navigation.dart';
import '../utils/verify_username.dart';
import '../utils/verify_email.dart';
import '../utils/verify_password.dart';
import '../utils/firebase_sign_up.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Redirect to home if user is already signed in
    if (isUserSignedIn()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/');
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateUsername);
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
  }

  void _validateUsername() {
    setState(() {
      _isUsernameValid = isValidUsername(_usernameController.text);
    });
  }

  void _validateEmail() {
    setState(() {
      _isEmailValid = isValidEmail(_emailController.text);
    });
  }

  void _validatePassword() {
    setState(() {
      _isPasswordValid = isValidPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (!_isUsernameValid)
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Username must not contain special characters and be at least 8 characters long',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  if (!_isEmailValid)
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Invalid email address format',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  if (!_isPasswordValid)
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Password must contain a special character and be at least 8 characters long',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_isUsernameValid &&
                              _isEmailValid &&
                              _isPasswordValid)
                          ? () async {
                              final error = await signUpWithEmail(
                                username: _usernameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              if (error != null && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error)),
                                );
                              } else if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Account created successfully!')),
                                );
                                navigateToHome(context);
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Create Account'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => navigateToLogin(context),
                    child: const Text(
                      'Already have an account? Log in here',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
