import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pop_movies/models/movie.dart';
import 'package:pop_movies/services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  int _pageCount = 0;
  List<Movie> _movies = [];

  ///Get list of pages
  int get pageCount => _pageCount;

  ///Get list of Movies
  List<Movie> get movies => _movies;

  Future<void> fetchMovies({int? page}) async {
    try {
      var response = await apiService.fetchMovies(page: page);
      // print(response.statusCode);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        List movieList = responseBody['results'];
        var pages = responseBody['total_pages'];
        _pageCount = int.parse(responseBody['total_pages'].toString());
        notifyListeners();

        for (var element in movieList) {
          _movies.add(Movie.fromJson(element));
          notifyListeners();
        }

        // notifyListeners();

        // Debugger.debug(tittle: "FetchPhotosFromApi: response-body", data: response.body);
      }
    } catch (e) {
      // Debugger.debug(tittle: "FetchPhotosFromApi: catch-error", data: e);
    }
  }
}
