import 'package:flutter/material.dart';

class DemoPage2 extends StatelessWidget {

  void closePage(BuildContext context){
    // Revenir sur la pile/page précédente
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Vous êtes sur la page 2 ! PITAYA A MIDI"),
            ElevatedButton(onPressed: () { closePage(context); }, child: Text("Revenir sur la page précédente (la page 1)"))
          ],
        ),
      ),
    );
  }
}