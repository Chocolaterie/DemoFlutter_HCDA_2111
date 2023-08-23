import 'dart:developer';
import 'package:email_validator/email_validator.dart';
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

/**
 * Classe utilitaire pour déclarer des validateurs
 */
class EniValidator {
  /**
   * Verifier la validité d'un champ
   */
  static String? validateEmail(String? value) {
    // Validateur
    if (!EmailValidator.validate(value!)) {
      return "Le champ email n'est pas valide";
    }
    return null;
  }
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  // valeur de l'email vide par défaut
  String emailValue = "";

  void onSubmit() {

    // Transférer les données (appeler l'even onSaved sur tout les champs)
    _formKey.currentState!.save();

    // Enclencher la validation
    if (_formKey.currentState!.validate()) {
      log("Formulaire valide");
    } else {
      log("Formulaire non valide");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          children: [
            TextFormField(
              validator: EniValidator.validateEmail,
              onSaved: (value) { emailValue = value!; },
              decoration: InputDecoration(hintText: "Veuillez entrer un email"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        onSubmit();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Submit"),
                      ))),
            )
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
