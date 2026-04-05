import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignIn")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "username",
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              child: ElevatedButton(
                onPressed: () => context.go('/homePage'),
                child: const Text("Login"),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/register'), 
              child: const Text("Don't have an account? please signUp"),
            ),
          ],
        ),
      ),
    );
  }
}