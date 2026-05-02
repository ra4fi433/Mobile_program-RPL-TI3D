// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// ------------------------------------------------class of screens
class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Replacement Screen"),), // AppBar with title
      body: Center(
        child: ElevatedButton(
          child: const Text('open other screen'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/another'); // This will replace the current screen with AnotherScreen
          },
      )
    ),
    );
  }
}
// ------------------------------------------------class of screens