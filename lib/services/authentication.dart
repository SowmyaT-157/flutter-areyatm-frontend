import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

Future<void> loginUser(
  String email,
  String password,
  BuildContext context,
) async {
  final url = Uri.parse('http://127.0.0.1:3007/login');
  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (!context.mounted) {
      return;
    }
    if (response.statusCode == 200) {
      context.go('/homePage');
    } else {
      final errorData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$errorData enter into error block')),
      );
    }
  } catch (e) {
    print("error comming: $e");
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('internet server error')));
  }
}
