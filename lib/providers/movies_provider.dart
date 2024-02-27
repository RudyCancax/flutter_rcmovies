import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/models/movie.dart';
import 'package:flutter_rc_movies/models/now_playing_resp.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  List<Movie> displayingMovies = [];

  MoviesProvider() {
    print('Moview provider initialized');
    getNowDisplayingMovies();
  }

  getNowDisplayingMovies() async {
    print('getting from themovie...');
    var url = Uri.https('api.themoviedb.org', '3/movie/now_playing', {
      'api_key': '297b1121305106efb94b90494dd70598',
      'language': 'es-ES',
      'page': '1'
    });

    var response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    print(nowPlayingResponse.results[0].title);
    // if (response.statusCode == 200) {
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }
    displayingMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
