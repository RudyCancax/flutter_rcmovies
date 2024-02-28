import 'dart:convert';
import 'cast.dart';

class Crew {
  int id;
  List<Cast> cast;
  List<Cast> crew;

  Crew({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory Crew.fromRawJson(String str) => Crew.fromJson(json.decode(str));

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );
}
