import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_constants.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TopRatedMovieCard extends StatelessWidget {
  TopRatedMovieCard({this.movie, this.position, this.onMoviePressed}) : super();

  final Movie movie;
  final int position;
  final Function onMoviePressed;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(
            movie.title,
          ),
          subtitle: SmoothStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: movie.popularity / 10,
            size: 15.0,
          ),
          leading: Image.network(
            "$BASE_IMAGE_URL/${movie.posterPath}",
          ),
          trailing: Text("#$position"),
          onTap: () {
            onMoviePressed(movie);
          },
        ),
      );
}
