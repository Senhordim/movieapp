import 'package:flutter/material.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/utils/api_utils.dart';

class ItemCustomCard extends StatelessWidget {
  final Movie movie;
  const ItemCustomCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      child: Row(
        children: [
          Image.network(
            API.requestIMG(movie.posterPath!),
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
