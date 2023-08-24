import 'dart:developer';
import 'package:eni_demo/demo_api/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:localization/localization.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

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
  // Des liste de films
  ProgressDialog? pd;
  var movies = [];

  void showProgress(){
    /// Create progress dialog
    pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd!.show(
      msg: 'Récupération des films...',
      progressBgColor: Colors.transparent,
      barrierColor: Color(0x55000000)
    );
  }

  void closeProgress(){
    pd!.close();
  }

  /**
   * Méthode pour appeler l'API afin de récupérer un Film
   */
  void callApi() async {
    // Afficher la progress bar
    showProgress();

    // Vider les films
    setState(() {
      movies = [];
    });

    // Simule 1 sec
    await Future.delayed(Duration(seconds: 1));

    // Etape 1: appeler l'entrypoint (en HTTP)
    var response = await http.get(Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movies.json"));

    // Si la réponse http est ok
    if (response.statusCode == 200){
      // Etape 2 : convertir le body de la réponse en json (donc les données)
      var json = convert.jsonDecode(response.body);

      // Etape 3 :Mapper le film depuis le json
      // Note : Grace au setState (Stateful) on va rafraichir l'écran
      setState(() {
        movies = json.map((movieJson) => Movie.mapFromJson(movieJson)).toList();
      });
    }

    // A la fin
    closeProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child: Text('Le film : ${movies[index].title}'),
                    );
                  }
              ),
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
