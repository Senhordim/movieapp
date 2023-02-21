import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;

  ValueNotifier<bool> inLoading = ValueNotifier(false);

  ValueNotifier<MoviesModel?> movies = ValueNotifier<MoviesModel?>(null);

  MoviesController(this._moviesRepository) {
    getMovies();
  }

  Future<void> getMovies() async {
    inLoading.value = true;
    movies.value = await _moviesRepository.getMovies();
    inLoading.value = false;
  }
}
