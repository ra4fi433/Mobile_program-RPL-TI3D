// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// ------------------------------------------------class of screens
  //-----------------------------------------------State Class For ReturnData Screen
  class ReturnDataScreen extends StatefulWidget {
    const ReturnDataScreen({super.key});

    @override

    State<ReturnDataScreen> createState() => _ReturnDataScreenState();
  }
  //-----------------------------------------------State Class For ReturnData Screen

  // ------------------------------------------------ constructor of screen
  class _ReturnDataScreenState extends State<ReturnDataScreen> {
    final TextEditingController _textFieldController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      // ------------------------------------------------ Return Data Screen UI
      return 
      Scaffold(
        appBar: AppBar(title: const Text("Return Data Screen"),), // AppBar with title
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: 
                const EdgeInsets.symmetric(horizontal: 16.0, ),
                child: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter some data',
                  ),
                )
              ),
                SizedBox(height: 10,),
                // ElevatedButton to send data back to the previous screen
                  ElevatedButton(
                    child: const Text('Send'),
                    onPressed: () {
                      Navigator.pop(context, _textFieldController.text);
                    }, 
                  // ElevatedButton to send data back to the previous screen
              ),
            ],
          )
        ),
      );
      }
      // ------------------------------------------------ Return Data Screen UI

      @override
      // Dispose Function to clean up the controller when the widget is removed from the widget tree
      void dispose() {
        _textFieldController.dispose();
        super.dispose();
      }
      // Dispose Function to clean up the controller when the widget is removed from the widget tree
    }
  // ------------------------------------------------ constructor of screen
// ------------------------------------------------class of screens