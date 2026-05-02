// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// ------------------------------------------------class of screens
class SecondScreenWithData extends StatelessWidget {
  const SecondScreenWithData(this.data, {super.key});
 final String data; // This variable will hold the data passed from the previous screen

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen with Data"),), // AppBar with title
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
             Text(data),
            Container (
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