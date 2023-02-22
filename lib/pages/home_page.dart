import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movies_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/pages/widgets/item_custom_card.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/services/dio_service_imp.dart';

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
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Movies',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ValueListenableBuilder<MoviesModel?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.movie!.length,
                          itemBuilder: (context, index) =>
                              ItemCustomCard(movie: movies.movie![index]),
                        )
                      : Center(child: Lottie.asset('assets/json/lottie.json'));
                }),
          ],
        ),
      ),
    ));
  }
}
