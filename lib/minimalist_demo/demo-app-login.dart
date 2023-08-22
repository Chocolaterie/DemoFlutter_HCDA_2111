import 'package:flutter/material.dart';

/**
 * Flutter Entry point
 */
void main() {
  runApp(AppDemoLogin());
}

// Constantes
const demoPrimaryColor = Color(0xFF2F2727);

/**
 * La page de connexion
 */
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Flex(
            direction: Axis.vertical,
            children: [
              // Titre du body
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Text("Login", style: TextStyle(fontSize: 38, color: demoPrimaryColor, fontWeight: FontWeight.bold),),
              ),
              // Description de la page
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text("Veuillez-vous connecter pour accéder à la plateforme", style: TextStyle(color: demoPrimaryColor),),
              ),
              // Champ : Email
              TextField(decoration: InputDecoration(hintText: "Email"),),
              // Champ : Password
              TextField(decoration: InputDecoration(hintText: "Password"), obscureText: true,),
              // Bouton Submit
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: demoPrimaryColor
                        ),
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Se Connecter"),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * L'application
 */
class AppDemoLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }

}