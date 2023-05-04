// Todo los de Result se cambia (Este viene como la respuesta a las peliculas que rebimios)
import 'dart:convert';

class Movie {
  Movie({
    // Le quitamos la propiedad required
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Como les queitamos el required le ponemos el ?
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  // Cambiamos el tipo de datos (Este lo tenemso como Enum )
  // eliminamos todo los de enum para evitarnos problemeas y cambiamos esto
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate; // Se cambio a String por el Datetime
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  // PAra recibir completa la riuta de l aimagen
  get fullPosterImg {
    if (this.posterPath != null) {
      // Asi es como biene en la API que se debe recibir una image
      return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
    }
    // metaer una imagen generica
    return 'https://via.placeholder.com/300x400';
  }

  // Recibir el titulo de la pelicula
  get titleMovie {
    if (this.originalTitle != null) {
      return this.originalTitle.toString();
    }
    return ' ';
  }

  // Este es para convertir a mapa
  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));
  // Este para ocnvertir a JSON (SE usa en POST para mandar datoa)
  //String toRawJson() => json.encode(toJson()); // No lo quereimos

  // CReamos un objeto de la clase movie
  // Mandamos lo que tenemos de las propiedades de la respueste
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        // Esta es una lista de todos los generos
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        // Como es uun String lo ponemos como otro string
        //originalLanguageValues.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate:
            json["release_date"], //DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

// Esto es para contruir un JSON que queramos mandar (no lo neceitamos
/*  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };*/
}
