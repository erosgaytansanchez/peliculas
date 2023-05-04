// To parse this JSON data, do
//
//     final nowPalyingResponse = nowPalyingResponseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

class NowPalyingResponse {
  NowPalyingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

// Decodifcando la respuesta de un JSON lo estamos tratando para meterlo a un mapa
  factory NowPalyingResponse.fromRawJson(String str) =>
      NowPalyingResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson()); Este nos snos river poqeue s para crear el json

// Este codifica
  factory NowPalyingResponse.fromJson(Map<String, dynamic> json) =>
      NowPalyingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  /*Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };*/
}

// Todo esto es para manejar la fechas
class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
