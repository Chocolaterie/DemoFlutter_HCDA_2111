import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{

  int counter = 0;
  bool isRun = false;

  CounterProvider(){
    // Lancer le compteur par défaut
    launch();
  }

  void launch() async{
    isRun = true;

    // Tant qu'il est lancé
    while (isRun) {
      incrementCounter();

      // Attendre 1 seconde
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  // Arreter le compteur
  void stop(){
    isRun = false;
  }

  void incrementCounter(){
    // Modifier la valeur
    counter++;

    // Notifier tout le monde que la valeur à changer
    notifyListeners();
  }

}