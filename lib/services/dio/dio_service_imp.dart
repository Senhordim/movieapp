import 'package:dio/dio.dart';
import 'package:movieapp/services/dio/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'authorization': {
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTkxZmRkMWFiM2VlYmVjNzU1NTc1YjdiZmNjMWIwNCIsInN1YiI6IjYxNzFlOGFiZDE4YjI0MDAyYmQ2MGMwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A2h2uNA2JBc4F_SyTEBpVLFKInRbqJSYk32phn7BDts',
        },
      }),
    );
  }
}
