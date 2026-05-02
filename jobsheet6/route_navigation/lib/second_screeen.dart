// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// ------------------------------------------------class of screens
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen"),), // AppBar with title
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is the second screen'),
              Container(
                height: 20,
              ),
  // ElevatedButton to navigate back to the previous screen
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
  // ElevatedButton to navigate back to the previous screen
            ),
          ],
        ),
      ),
    );
  }
}
// ------------------------------------------------class of screens