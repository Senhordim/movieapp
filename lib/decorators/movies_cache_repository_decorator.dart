import 'dart:convert';

import 'package:movieapp/decorators/movies_repository_decorator.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<MoviesModel> getMovies() async {
    try {
      MoviesModel movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(MoviesModel movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print("Salvou no cache os filmes $jsonMovies");
  }

  Future<MoviesModel> _getInCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache');
    var json = jsonDecode(moviesJsonString!);
    var movies = MoviesModel.fromJson(json);
    print("Recuperou do cache os filmes ${movies.toString()}}");
    return movies;
  }
}
