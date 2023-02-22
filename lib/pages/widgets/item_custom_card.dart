import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/utils/api_utils.dart';

class ItemCustomCard extends StatelessWidget {
  final Movie movie;
  const ItemCustomCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 200,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Image.network(
              API.requestIMG(movie.posterPath!),
              loadingBuilder: (_, child, progress) {
                if (progress == null) return child;
                return Lottie.asset('assets/json/image.json');
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.titleMedium,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Votos: ' + movie.voteAverage!.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                    softWrap: true,
                  ),
                  const Spacer(),
                  Text(
                    'Popularidade: ' + movie.popularity!.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
