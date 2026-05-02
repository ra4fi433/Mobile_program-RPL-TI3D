// ------------------------------------------------Import libraries
import 'package:flutter/material.dart'; // For Flutter UI components and material design
 // ------------------------------------------------ for importing other screens
import 'package:route_navigation/second_screeen.dart';
import 'package:route_navigation/second_screen_with_data.dart';
import 'package:route_navigation/return_data.dart';
import 'package:route_navigation/replacement_screen.dart';
import 'package:route_navigation/another_screen.dart';
  // ------------------------------------------------ for importing other screens
// ------------------------------------------------Import libraries


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
  const MyApp({Key? key}) : super(key: key);


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

       // ----------------------------------------------- Routes
        initialRoute: '/',
        routes: {
          '/': (context) => const Firstpage(),
          '/second': (context) => const SecondScreen(),
          '/second_with_data': (context) => SecondScreenWithData(ModalRoute.of(context)?.settings.arguments as String),
          '/return_data': (context) => const ReturnDataScreen(),
          '/another': (context) => const AnotherScreen(),
          '/replacement': (context) => const ReplacementScreen(),
         
        },
       // ----------------------------------------------- Routes 

      );
  }
}
//----------------------------------------------MyApp Class

//----------------------------------------------------Class Of Firstpage Widget
class Firstpage extends StatefulWidget { // This is the main screen of the app, which is stateful because it will have interactive elements
      const Firstpage({super.key});

      @override
      State<Firstpage> createState() => _FirstpageState(); // This creates the state for the Firstpage widget, which will manage the interactive elements and their state
}
//----------------------------------------------------Class Of Firstpage Widget

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
        // If width is greater than 600, show Desktop version
        if (constraints.maxWidth > 600) {
          return desktopBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}

//------------------------------------------------------Class Of Responsive Layout Widget



//----------------------------------------------------State Class For Firstpage Screen
class _FirstpageState extends State<Firstpage> { // This is the state class for the Firstpage widget
        @override
        Widget build(BuildContext context) { // This builds the UI for the Firstpage screen
          Size screenSize = MediaQuery.of(context).size; // This gets the size of the screen, MediaQuery is a widget that provides information about the size and orientation of the screen, and other media features. Here we are using it to get the size of the screen, which will be used to make the UI responsive to different screen sizes.
          Orientation orientation = MediaQuery.of(context).orientation;
          
           // This gets the orientation of the screen, which can be either portrait or landscape. This will be used to adjust the layout of the UI based on the orientation of the device.

        return Scaffold( // Scaffold is a widget that provides a basic structure for the app, including an app bar, body, and other common UI elements. Here we are using it to create the main structure of the Firstpage screen.
          appBar: AppBar(title: const Text("Jobsheet 6 - Navigation and Routes")), // This is the app bar with the title of the app
          // backgroundColor: Colors.blueGrey, // This is the app bar with the title of the app
          body: ResponsiveLayout( // This is the body of the app, which is responsive to different screen sizes
//------------------------------------------------------MOBILE VIEW: Simple placeholder for device orientation        
              mobileBody: ListView(
               
                padding: const EdgeInsets.symmetric(vertical: 20),
                  children: <Widget>[
                   Center(
                     child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      // -------------------------------- Navigation Buttons
                        children: [
                          ElevatedButton(
                            child: const Text('to Second Screen'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/second');
                            },
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            child: const Text('to Navigation with Data Screen'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/second_with_data', 
                              arguments: 'Hello from Home Screen!');
                            },
                          ), 
                          SizedBox(height: 20,),
                          ElevatedButton(
                            child: const Text('return data from Another Screen'),
                            onPressed: () async{
                              final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
                              final result = await Navigator.pushNamed(context, '/return_data');
                              SnackBar snackBar = SnackBar(content: Text('Data received: $result'));
                              scaffoldMessenger.showSnackBar(snackBar);
                            },
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            child: const Text('to Replacement Screen'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/replacement');
                            },
                          ),
                        ],
                      // -------------------------------- Navigation Buttons
                      ),
                   ),
                  ],
                ),
//------------------------------------------------------MOBILE VIEW: Simple placeholder for device orientation

//------------------------------------------------------DESKTOP VIEW: Simple placeholder for device orientation
            desktopBody: Container(
              // color: Colors.black26,
              
                width: screenSize.width,
                // padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
            // -------------------------------- Navigation Buttons
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       ElevatedButton(
                            child: const Text('to Second Screen'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/second');
                            },
                          ),
                        Container(width: 10,),
                        ElevatedButton(
                          child: const Text('to Navigation with Data Screen'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/second_with_data', arguments: 'Hello from Home Screen!');
                          },
                        ),
                      ],),
                      Container(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('return data from Another Screen'),
                          onPressed: () async{
                            final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
                            final result = await Navigator.pushNamed(context, '/return_data');
                            SnackBar snackBar = SnackBar(content: Text('Data received: $result'));
                            scaffoldMessenger.showSnackBar(snackBar);
                          },
                        ),
                        Container(width: 10,),
                         ElevatedButton(
                          child: const Text('to Replacement Screen'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/replacement');
                          },
                        ), 
                      ],),
                  ],
            // -------------------------------- Navigation Buttons
                ),
              ),
            ),
//------------------------------------------------------DESKTOP VIEW: Simple placeholder for device orientation
          );
    
  }
}
//----------------------------------------------------State Class For Firstpage Screen