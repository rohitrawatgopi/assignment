import 'dart:developer';

import 'package:assignment/model/movies.dart';
import 'package:dio/dio.dart';

class MoviesRepo {
  static Future<List<MovieModel>> fetchMovies() async {
    final dio = Dio();
    List<MovieModel> movieList = [];

    try {
      final response =
          await dio.get("https://api.tvmaze.com/search/shows?q=all");

      if (response.statusCode == 200) {
        var data = response.data as List;

        movieList = data.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      throw Exception('Internal Error');
    }

    return movieList;
  }

  static Future<List<MovieModel>> searchMovie(String query) async {
    Dio dio = Dio();
    List<MovieModel> searchResult = [];
    try {
      final response =
          await dio.get("https://api.tvmaze.com/search/shows?q=${query}");
      if (response.statusCode == 200) {
        var data = response.data as List;

        searchResult = data.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to search movies');
      }
      log(searchResult.toString());
    } catch (e) {
      throw Exception('Internal Error');
    }
    return searchResult;
  }
}
