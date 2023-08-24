import 'package:eni_demo/navigation_demo/demo-page-1.dart';
import 'package:eni_demo/navigation_demo/demo-page-2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoNavigationApp());
}

class DemoNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => DemoPage1(),
        "/page2" : (context) => DemoPage2()
      },
    );
  }
}
