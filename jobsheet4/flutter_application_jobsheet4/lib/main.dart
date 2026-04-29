import 'package:flutter/material.dart';

// Attention, This Assignment was Created with assisted by LLM
// Assignment: Create a Flutter app with the following features:
// 1. A TextField to input text, and a button that shows the input text in a popup when pressed.
// 2. Two buttons that show different fonts in a popup when pressed.
// 3. A dropdown menu with two options: "Network Image" and "Asset Image". When an option is selected, show a popup with the corresponding image (you can use any image you like, just make sure to include an asset image in your project).
// 4. A volume control with a Text widget showing the current volume level and two buttons to increase and decrease the volume. 

  void main() { // This is the main function
    runApp(MyApp());
  }
  void _showImagePopup(BuildContext context, String title, Widget imageWidget) { // This function shows a popup with the given title and image
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Makes the popup fit the image
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: imageWidget, // This displays your cat or network image
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
    }
  class MyApp extends StatelessWidget { // This is the root widget of the application
    const MyApp({super.key});

    @override

      Widget build(BuildContext context) { // This builds the MaterialApp with a custom theme and sets Home as the home screen
        return MaterialApp(
          title: 'First Flutter App',

          theme: ThemeData(
            useMaterial3: false, // Forces the old Blue style
            primarySwatch: Colors.blue,
          ),

      home: Home(),
          );
        }
      }

  class Home extends StatefulWidget { // This is the main screen of the app, which is stateful because it will have interactive elements
      const Home({super.key});

      @override
      State<Home> createState() => _HomeState(); // This creates the state for the Home widget, which will manage the interactive elements and their state
    }

  class _HomeState extends State<Home> { // This is the state class for the Home widget, where we will define the interactive elements and their behavior

    String? selectedValue; // This will hold the selected value from the dropdown
    int volumeValue = 10; // Initial volume value, can be adjusted with the buttons
    final TextEditingController _controller = TextEditingController(); // This controller will manage the text input from the TextField

    @override

    Widget build(BuildContext context) { // This builds the UI of the Home screen, which includes a TextField, buttons, a dropdown, and volume controls
      return Scaffold(
        appBar: AppBar(title: const Text("Jobsheet 4 - Flutter Widgets")), // This is the app bar with the title of the app
        body: Center( // This centers the content of the body
          child: 
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center Vertical
            crossAxisAlignment: CrossAxisAlignment.center, // Center Horizontal
            children: [
              // --- FIRST COLUMN: 1 TextField ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: 
                  TextField( // This is the TextField where users can input text, and it uses the _controller to manage the input
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Command Sir',
                    ),
                  ),
                ),

              ElevatedButton( // This button will show the text from the TextField in a popup when pressed
                child: 
                  const Text('Submit'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                          return AlertDialog(
                          content: Text(_controller.text),
                            actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ), 
                            ],
                          );
                        },
                      );
                    },
              ),
        
              Container(height: 30),      
              // --- SECOND COLUMN: 2 Buttons ---    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton( // This button will show a popup with "Font A" in the "game_over" font when pressed
                    onPressed: () {
                    showDialog( // This shows a popup dialog when the button is pressed
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: 
                            Text(
                              'Font A',
                              style: TextStyle(

                              fontFamily: 'game_over', // This uses the custom font defined in pubspec.yaml
                              fontSize: 72,
                              ),
                          ),
                          actions: [ // This is the close button for the popup 
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                    },
                    child:  Text("Font A", style: TextStyle(fontSize: 18)),
                  ),

                  // const SizedBox(width: 20),
                  Container(height: 10), // This is a spacer between the two buttons
                  OutlinedButton( // This button will show a popup with "Font B" in the "Vogue" font when pressed
                    onPressed: () {
                      showDialog( // This shows a popup dialog when the button is pressed
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: 
                            Text(
                              'Font B',
                              style: TextStyle(
                                fontFamily: 'Vogue', // This uses the custom font defined in pubspec.yaml
                                fontSize: 30,
                              ),
                            ),
                            actions: [ // This is the close button for the popup
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  Text('Close'), 
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Font B", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
          
            
              const SizedBox(height: 20), // Spacing between the second and third columns
              Container(height: 10),
              // --- THIRD COLUMN: Dropdown & Volume Control ---
              Column(
                children: [
                  // Dropdown with Images
                  DropdownButton<String>( // This is the dropdown menu that allows users to select between "Network Image" and "Asset Image"
                    hint: const Text("Select Media Type"),
                    value: selectedValue,
                    items: [
                      DropdownMenuItem( // This dropdown item represents the "Network Image" option, and it includes a small preview of the image
                        value: "Network",
                        child: Row(
                          children: [
                            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXn5EtzzicNOobCDgfX54x8raTejSIvBXQLQ&s', width: 24),
                            const SizedBox(width: 10),
                            const Text("Network Image"),
                          ],
                        ),
                      ),
                      DropdownMenuItem( // This dropdown item represents the "Asset Image" option, and it includes a small preview of the image (make sure to include the image in your assets folder and reference it correctly in pubspec.yaml)
                        value: "Asset",
                        child: Row(
                          children: [
                            // Ensure this file exists in your assets folder!
                            Image.asset('images/cat-time.jpeg', width: 24),
                            // const Icon(Icons.image), 
                            const SizedBox(width: 10),
                            const Text("Asset Image"),
                          ],
                        ),
                      ),
                    ],
                    // onChanged: (val) => setState(() => selectedValue = val),
                    onChanged: (val) { // This is the callback that gets triggered when a new option is selected from the dropdown, and it updates the selectedValue state and shows the corresponding image in a popup
                      setState(() => selectedValue = val); // This updates the state with the selected value from the dropdown
                      
                      // Trigger the popup based on what was selected
                      if (val == "Asset") { // If the user selects "Asset Image", show a popup with the asset image (make sure to include the image in your assets folder and reference it correctly in pubspec.yaml)
                        _showImagePopup(
                          context, 
                          "Cat Time!", 
                          Image.asset('images/cat-time.jpeg')
                        );
                      } else if (val == "Network") { // If the user selects "Network Image", show a popup with the network image
                        _showImagePopup(
                          context, 
                          "Random Image", 
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXn5EtzzicNOobCDgfX54x8raTejSIvBXQLQ&s')
                        );
                      }
                    },
                  ),
                  

                  const SizedBox(height: 10), // Spacing between the dropdown and the volume controls
                  Container(height: 10),

                  // Volume IconButton Row (Simulated)
                  Row( // This row contains the volume control, which includes a Text widget showing the current volume level and two IconButtons to increase and decrease the volume
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton( // This button decreases the volume when pressed, and it updates the volumeValue state
                        icon: const Icon(Icons.volume_down),
                        onPressed: () => setState(() => volumeValue--),
                      ),
                      Text("Volume: $volumeValue", 
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                      IconButton( //  This button increases the volume when pressed, and it updates the volumeValue state
                        icon: const Icon(Icons.volume_up),
                        onPressed: () => setState(() => volumeValue++),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }


