import 'dart:convert';

import 'package:http_request/http_service/httpMovie.dart';
import 'package:http_request/models/movieModel.dart';

class GetPopular {
  Future<List<Movie>> getPopular() async {
    HttpService httpService = HttpService();
    final getPopularMovies = await httpService.get('/popular');
    final parsePopularMovies = jsonDecode(getPopularMovies);
    final popularMovies = parsePopularMovies['results'] as List<dynamic>;
    final List<Movie> movies =
        List<Movie>.from(popularMovies.map((e) => Movie.fromJson(e)));

    return movies;
  }
}
