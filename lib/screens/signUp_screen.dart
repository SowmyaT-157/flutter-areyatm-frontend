import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
export './signUp_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "first Name"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "last Name"),
            ),
            const TextField(decoration: InputDecoration(labelText: "email")),
            const TextField(
              decoration: InputDecoration(labelText: "password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/login'),
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


