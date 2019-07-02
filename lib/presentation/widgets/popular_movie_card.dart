import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';

class PopularMovieCard extends StatelessWidget {
  PopularMovieCard({this.movie}) : super();

  final Movie movie;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(this.movie.title),
          subtitle: Text(this.movie.releaseDate.toIso8601String()),
          leading: Image.network(
            "http://image.tmdb.org/t/p/w185/${this.movie.posterPath}",
          ),
        ),
      );
}
