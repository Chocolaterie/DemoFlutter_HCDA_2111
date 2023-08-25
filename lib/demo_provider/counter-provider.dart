import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{

  int counter = 0;

  void incrementCounter(){
    // Modifier la valeur
    counter++;

    // Notifier tout le monde que la valeur à changer
    notifyListeners();
  }

}