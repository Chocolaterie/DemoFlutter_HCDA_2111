import 'package:eni_demo/stateful_demo/counter-widget.dart';
import 'package:flutter/material.dart';

/**
 * Flutter Entry point
 */
void main() {
  runApp(AppDemoStateful1());
}

/**
 * La page d'accueil
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CounterWidget(),
      ),
    );
  }
}

/**
 * L'application
 */
class AppDemoStateful1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}