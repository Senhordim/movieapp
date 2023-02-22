import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title!),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Hero(
                    tag: movie.id!,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  movie.overview!,
                  style: Theme.of(context).textTheme.headlineSmall,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ));
  }
}
