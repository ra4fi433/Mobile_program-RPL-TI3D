// ------------------------------------------------Import libraries
import 'package:flutter/material.dart';
// ------------------------------------------------Import libraries

// these project cointains
// widgets of Expanded, Flexible, and LayoutBuilder, MediaQuery, 
//and a custom ResponsiveLayout widget that switches between mobile 
//and desktop layouts based on screen width. The Home screen displays screen info 
//and experiments with Expanded and Flexible widgets in different arrangements for both mobile and desktop views.

//--------------------------------------------------Main Function
void main() {
  // This is the main function
  runApp(MyApp());
}
//--------------------------------------------------Main Function

//----------------------------------------------MyApp Class
class MyApp extends StatelessWidget {
  // This is the root widget of the application
  // const MyApp({super.key});
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // This builds the MaterialApp with a custom theme and sets Home as the home screen
    return 
      MaterialApp(
        title: 'First Flutter App',
        theme: ThemeData(
          useMaterial3: false, // Forces the old Blue style
          primarySwatch: Colors.blue,
        ),

        home: Home(),
        // home: Scaffold(appBar: AppBar(title: const Text('First Flutter App'))),
      );
  }
}
//----------------------------------------------MyApp Class

//----------------------------------------------------Class Of Home Widget
class Home extends StatefulWidget { // This is the main screen of the app, which is stateful because it will have interactive elements
      const Home({super.key});

      @override
      State<Home> createState() => _HomeState(); // This creates the state for the Home widget, which will manage the interactive elements and their state
}
//----------------------------------------------------Class Of Home Widget

//----------------------------------------------------Class Of Expanded Widget
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(padding: 
        const EdgeInsets.all(8.0),
        child: const Text(
          'Expanded Widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
      ),
    );
  }
}
//------------------------------------------------------------------Expanded Widget

//------------------------------------------------------Class Of Flexible Widget
class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[700],
          borderRadius: BorderRadius.circular(8),
        ),

        child: Padding(padding: 
        const EdgeInsets.all(8.0),
        child: const Text(
          'Flexible Widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    );
  }
}
//------------------------------------------------------------------Flexible Widget

//------------------------------------------------------Class Of Responsive Layout Widget
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody; // This is the widget that will be displayed on mobile devices
  final Widget desktopBody; // This is the widget that will be displayed on desktop devices

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    // This builds the responsive layout by checking the width of the screen and displaying the appropriate widget
    return LayoutBuilder(
      builder: (context, constraints) {
        // If width is greater than 800, show Desktop version
        if (constraints.maxWidth > 800) {
          return desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}

//------------------------------------------------------Class Of Responsive Layout Widget



//----------------------------------------------------State Class For Home Screen
class _HomeState extends State<Home> { // This is the state class for the Home widget
        @override
        Widget build(BuildContext context) { // This builds the UI for the Home screen
          Size screenSize = MediaQuery.of(context).size; // This gets the size of the screen, MediaQuery is a widget that provides information about the size and orientation of the screen, and other media features. Here we are using it to get the size of the screen, which will be used to make the UI responsive to different screen sizes.
          Orientation orientation = MediaQuery.of(context).orientation; // This gets the orientation of the screen, which can be either portrait or landscape. This will be used to adjust the layout of the UI based on the orientation of the device.

        return Scaffold( // Scaffold is a widget that provides a basic structure for the app, including an app bar, body, and other common UI elements. Here we are using it to create the main structure of the Home screen.
          appBar: AppBar(title: const Text("Jobsheet 5 - Responsive Widgets")), // This is the app bar with the title of the app
          backgroundColor: Colors.blueGrey, // This is the app bar with the title of the app
          body: ResponsiveLayout( // This is the body of the app, which is responsive to different screen sizes
//------------------------------------------------------MOBILE VIEW: Simple placeholder for device orientation        
              mobileBody: ListView(
                // width: screenSize.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                // child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Screen Info Section
                    Padding(
                      padding: const EdgeInsets.all(5.5),
                      child: Column(
                        children: [
                          Text(
                            'Screen width: ${screenSize.width.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Orientation: ${orientation.toString().split('.').last}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
////-----------------------------------------------------Space between sections                    
                    const SizedBox(height: 30),
//-----------------------------------------------------Space between sections
                    // Widget Row Experiments
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const Row(children: [ExpandedWidget()]),
                          const SizedBox(height: 10),
                          const Row(children: [FlexibleWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [FlexibleWidget()]),
                          const SizedBox(height: 10),
                          const Row(children: [ExpandedWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [ExpandedWidget()]),
                          const SizedBox(height: 10),
                          const Row(children: [ExpandedWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [FlexibleWidget()]),
                          const SizedBox(height: 10),
                          const Row(children: [FlexibleWidget()]),
                         
                        ],
                      ),
                    ),
                  ],
                ),
//------------------------------------------------------MOBILE VIEW: Simple placeholder for device orientation

//------------------------------------------------------DESKTOP VIEW: Simple placeholder for device orientation
            desktopBody: Container(
              color: Colors.black26,
              child: Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Screen Info Section
                    Padding(
                      padding: const EdgeInsets.all(5.5),
                      child: Column(
                        children: [
                          Text(
                            'Screen width: ${screenSize.width.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Orientation: ${orientation.toString().split('.').last}',
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
//-----------------------------------------------------Space between sections                    
                    const SizedBox(height: 30),
//-----------------------------------------------------Space between sections
                    // Widget Row Experiments
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const Row(children: [ExpandedWidget(), SizedBox(width: 10), FlexibleWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [FlexibleWidget(), SizedBox(width: 10), ExpandedWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [ExpandedWidget(), SizedBox(width: 10), ExpandedWidget()]),
                          const SizedBox(height: 30),
                          const Row(children: [FlexibleWidget(), SizedBox(width: 10), FlexibleWidget()]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
//------------------------------------------------------DESKTOP VIEW: Simple placeholder for device orientation
          ),
    );
  }
}
//----------------------------------------------------State Class For Home Screen