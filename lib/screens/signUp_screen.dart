import 'package:arey_atm/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
export './signUp_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: "first Name"),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: "last Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                createUser(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _passwordController.text,
                  context,
                );
              },
              child: const Text("signUp"),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text("Already have an account, please sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
