import 'dart:convert';
import 'package:flutter_rc_movies/models/models.dart';

class MostPopular {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MostPopular({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MostPopular.fromRawJson(String str) =>
      MostPopular.fromJson(json.decode(str));

  factory MostPopular.fromJson(Map<String, dynamic> json) => MostPopular(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
