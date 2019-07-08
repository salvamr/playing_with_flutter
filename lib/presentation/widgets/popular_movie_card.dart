import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_constants.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';

class PopularMovieCard extends StatelessWidget {
  PopularMovieCard({this.movie}) : super();

  final Movie movie;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.originalTitle),
          leading: Image.network("$BASE_IMAGE_URL/${movie.posterPath}"),
        ),
      );
}
