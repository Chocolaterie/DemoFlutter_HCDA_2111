import 'package:eni_demo/stateful_demo/counter-widget.dart';
import 'package:flutter/material.dart';

/**
 * Flutter Entry point
 */
void main() {
  runApp(AppDemoStateful2());
}

/**
 * La page d'accueil
 */
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class EniValidator {

  static String? validateEmail(String? value){
    if (value!.isEmpty){
      return "Le champ est vide";
    }
    return null;
  }
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  void onSubmit(){
    // Enclencher la validation
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Flex(direction: Axis.vertical,
          children: [
            TextFormField(
              validator: EniValidator.validateEmail,
              decoration: InputDecoration(
              hintText: "Veuillez entrer un email"
            ),),
            ElevatedButton(onPressed: (){ onSubmit(); }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}

/**
 * L'application
 */
class AppDemoStateful2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}