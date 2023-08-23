import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  @override
  State<CounterWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {

  int counter = 0;
  bool activeAutoCounter = false;

  void incrementCounter(){
    // Rafraichir la vue
    setState(() {
      // incrementer le compteur
      counter++;
    });
  }

  void stopCounter() {
    activeAutoCounter = false;
  }

  void countup() async {
    // Je prépare à enclancher le compteur automatique
    activeAutoCounter = true;

    // Tant que le compteur est actif
    while(activeAutoCounter){

      // Attendre 0.5 seconde
      await Future.delayed(const Duration(milliseconds: 500));

      // Incrementer le comtpeur
      incrementCounter();
    }
  }

  String getCounterAutoStateText(){
    if (activeAutoCounter){
      return "Le compteur automatique est activé";
    }
    return "Le compteur automatique est désactivé";
  }

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Text("Counter : ${counter}", style: TextStyle(fontSize: 38),),
      Text(getCounterAutoStateText()),
      // le bouton lancer compteur
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(onPressed: () => { incrementCounter() }, child: Text("Incrementer")),
      ),
      // le bouton arreter le compteur
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(onPressed: () => { countup() }, child: Text("Lancer le compteur")),
      ),
      ElevatedButton(onPressed: () => { stopCounter() }, child: Text("Arreter le compteur"))
    ],);
  }

}