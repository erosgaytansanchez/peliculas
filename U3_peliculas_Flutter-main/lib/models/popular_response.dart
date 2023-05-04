import 'models.dart';

import 'dart:convert';

class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}


// Cambiamos el REsult por "Movie" (Se importa Movie)

// Lo que esta entre los dos Factory el RawJSON  (Solo nos quedamos con esos dos Factory)

// Eliminamos la CLAse MOVIE porque ya la tenemos en otra parte

// El que esta en MAP cambiamos por Movie (SE ELIMINA TODO)
// List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
