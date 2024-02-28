import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rc_movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  List<Movie> displayingMovies = [];
  List<Movie> mostPopularMovies = [];
  List<Cast> movieCrew = [];

  MoviesProvider() {
    getNowDisplayingMovies();
    getMostPopularMovies();
    // getCrewMovie('1096197');
  }

  getNowDisplayingMovies() async {
    var response = await getResponse('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    displayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getMostPopularMovies() async {
    var response = await getResponse('3/movie/popular');
    final nowPlayingResponse = MostPopular.fromRawJson(response.body);
    mostPopularMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  Future<List<Cast>> getCrewMovie(String movieId) async {
    var response = await getResponse('3/movie/$movieId/credits');
    final nowPlayingResponse = Crew.fromRawJson(response.body);
    movieCrew = nowPlayingResponse.cast;
    return movieCrew;
  }

  getResponse(String categoryPath) async {
    var url = Uri.https('api.themoviedb.org', categoryPath, {
      'api_key': '297b1121305106efb94b90494dd70598',
      'language': 'es-ES',
      'page': '1'
    });
    var response = await http.get(url);
    return response;
  }
}
