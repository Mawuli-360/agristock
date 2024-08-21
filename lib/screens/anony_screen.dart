import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnonymousSignInScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AnonymousSignInScreen({super.key});

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed in anonymously')),
      );
      // Navigate to the next screen or update UI as needed
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anonymous Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign In Anonymously'),
          onPressed: () => _signInAnonymously(context),
        ),
      ),
    );
  }
}
