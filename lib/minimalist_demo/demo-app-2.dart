import 'package:flutter/material.dart';

/**
 * Flutter Entry point
 */
void main() {
  runApp(AppDemo2());
}

/**
 * La page d'accueil
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Text("Colonne 1 - Ligne 1")),
          Image.asset("images/dog.png"),
          Expanded(
            child: Row(
              children: [
                Text("Colonne 1 - Ligne 2"),
                Text("Colonne 2 - Ligne 2")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Colonne 1 - Ligne 3"),
          ),
          Text("Colonne 1 - Ligne 4"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Boutton"))),
          )
        ],
      ),
    );
  }
}

/**
 * L'application
 */
class AppDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}