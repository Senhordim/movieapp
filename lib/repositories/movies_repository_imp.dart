import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/services/dio/dio_service.dart';

import 'package:movieapp/utils/api_utils.dart';

class MovieRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MovieRepositoryImp(this._dioService);

  @override
  Future<MoviesModel> getMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.requestMovieList);
    return MoviesModel.fromJson(result.data);
  }
}
