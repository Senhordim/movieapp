import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;

  ValueNotifier<bool> inLoading = ValueNotifier(false);

  ValueNotifier<MoviesModel?> movies = ValueNotifier<MoviesModel?>(null);
  MoviesModel? _cachedMovies;

  MoviesController(this._moviesRepository) {
    getMovies();
  }

  Future<void> getMovies() async {
    inLoading.value = true;
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
    inLoading.value = false;
  }

  searchMovies(String query) async {
    List<Movie> resultList = _cachedMovies!.listMovies!
        .where((e) => e.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    movies.value = MoviesModel(listMovies: resultList);
  }
}
