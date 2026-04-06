import 'package:arey_atm/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});

 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignIn")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:_emailController,
              decoration: const InputDecoration(
                labelText: "email"
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  loginUser(_emailController.text, _passwordController.text,context);
                },
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