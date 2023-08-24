import 'dart:developer';
import 'package:eni_demo/demo_api/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:localization/localization.dart';

/**
 * Le Lanceur
 */
void main() {
  runApp(DemoApiApp());
}

/**
 * L'application
 */
class DemoApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localeResolutionCallback: (locale, supportedLocales) {
          // default language
          return Locale('en', 'US');
        },
        supportedLocales: [
          Locale('en', 'US'),
          Locale('fr', 'FR'),
        ],
        localizationsDelegates: [
          // delegate from flutter_localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // delegate from localization package.
          LocalJsonLocalization.delegate,
        ],
        home: DemoMoviePage()
    );
  }
}

/**
 * La page
 */
class DemoMoviePage extends StatefulWidget {

  @override
  State<DemoMoviePage> createState() => _DemoMoviePageState();
}

class _DemoMoviePageState extends State<DemoMoviePage> {
  // Le film de la page
  Movie? currentMovie = Movie();

  /**
   * Méthode pour appeler l'API afin de récupérer un Film
   */
  void callApi() async {
    // Etape 1: appeler l'entrypoint (en HTTP)
    var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movie.json"));

    // Si la réponse http est ok
    if (response.statusCode == 200){
      // Etape 2 : convertir le body de la réponse en json (donc les données)
      Map<String, dynamic> json = convert.jsonDecode(response.body);

      // Etape 3 :Mapper le film depuis le json
      // Note : Grace au setState (Stateful) on va rafraichir l'écran
      setState(() {
        currentMovie = Movie.mapFromJson(json);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('label.movie.title'.i18n([currentMovie!.title!])),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('label.movie.detail'.i18n([currentMovie!.title!, currentMovie!.description!])),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () { callApi(); }, child: Text("Appeler l'API")))
          ],
        ),
      ),
    );
  }
}
