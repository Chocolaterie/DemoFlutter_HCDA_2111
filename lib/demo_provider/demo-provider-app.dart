import 'package:eni_demo/demo_provider/counter-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
  ], child: DemoProviderApp()));
}

class DemoProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoProviderPage(),
    );
  }
}

class DemoProviderPage extends StatelessWidget {
  void callProviderIncrement(BuildContext context) {
    // Appeler singleton
    CounterProvider counterProvider = Provider.of<CounterProvider>(context, listen: false);
    // Appeler méthode customisée pour incrémenter
    counterProvider.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Ecouter la valeur
            Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
              return Text("Counter : ${counterProvider.counter}");
            }),
            // Appeler le provider
            ElevatedButton(
                onPressed: () {
                  callProviderIncrement(context);
                },
                child: Text("Increment"))
          ],
        ),
      ),
    );
  }
}