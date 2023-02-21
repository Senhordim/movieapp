import 'package:flutter/material.dart';
import 'package:movieapp/controllers/movies_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/service/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesController _controller = MoviesController(
    MovieRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie App'),
        ),
        body: ValueListenableBuilder<MoviesModel?>(
            valueListenable: _controller.movies,
            builder: (_, movies, __) {
              return movies != null
                  ? ListView.builder(
                      itemCount: movies.results!.length,
                      itemBuilder: (context, index) => Text(
                            movies.results![index].title!,
                          ))
                  : Container();
            }));
  }
}
