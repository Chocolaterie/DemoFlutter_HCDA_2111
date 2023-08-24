import 'package:flutter/material.dart';

class DemoPage1 extends StatelessWidget {

  void openPage1(BuildContext context){
    Navigator.pushNamed(context, "/page2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Vous êtes sur la page 1 !"),
            ElevatedButton(onPressed: () { openPage1(context); }, child: Text("Ouvrir la page 2"))
          ],
        ),
      ),
    );
  }
}