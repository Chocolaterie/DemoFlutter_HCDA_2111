class Movie {
  int id;
  String title;
  String description;

  /**
   * Constructeur
   */
  Movie({this.id = -1, this.title = "", this.description = ""});

  /**
   * La fonction utilitaire static pour avoir une instance de Movie depuis le JSON
   */
  static Movie mapFromJson(Map<String, dynamic> json){
    return Movie(id: json['id'], title: json['title'], description: json['description']);
  }
}