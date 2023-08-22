import 'package:flutter/material.dart';

/**
 * Flutter Entry point
 */
void main() {
  runApp(AppDemo1());
}

/**
 * La page d'accueil
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Demo Home Page"),
      ),
    );
  }
}

/**
 * L'application
 */
class AppDemo1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}