import 'package:currency_coverter/currency_converter_cupertino.dart';
import 'package:currency_coverter/currency_converter_material.dart'; //package importing
import 'package:flutter/cupertino.dart';
// import './currency_converter_material.dart';// Relative importing
import 'package:flutter/material.dart'; // used to import different methods of flutter such as runapp, etc

void main() {
  //runapp an inbuild function to run the app
  // =>Widgets are the building blocks of the user interface.They are responsible on how the UI should look like.
  // Const- to declare that the constructor is a compile time constant.
  // means the widget(MyApp) doesn't need to get created everytime ,create it one time and that's enough
  runApp(const MyApp());
}

// Types of Widgets
// 1. StatelessWidget- Where data is immutable.State ones created cannot be changed.Can run only once when the class is loaded.
//                     Cannot be redrawn after any user interactions.
// 2. StatefulWidget- Where data is mutable.States can be changed

// Two types Design-
// 1. Material Design- for android
// 2. Cupertino Design- for ios

class MyApp extends StatelessWidget {
  // superclass- abstract class(StatelessWidget)
  //super(key: key)-you're passing the key received by MyApp's constructor to
  //the parent class.
  // const MyApp({Key? key}) : super(key: key);
  //optionally asking for key from the constructor and if there than pass it to the parent abstract class
  //key- helps flutter identify and differentiate btw widgets
  const MyApp({super.key});
  @override
  //build function is used to render something on the screen
  Widget build(BuildContext context) {
    // Material app used to set navigation in our app.It is used as a global entity.
    return const MaterialApp(
        //widgets are every class that we make and call in the build function without any error
        //Scanffold = acts as a framework for our App .
        //It provides a layout that helps you organize the different parts of your app's screen
        //Eg:header,body,footer etc
        //Home-defines what's default display or what should be displayed at the start of the app
        home: CurrencyConverterMaterialPage());
  }
}

class MyCuppertinoApp extends StatelessWidget {
  const MyCuppertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}
