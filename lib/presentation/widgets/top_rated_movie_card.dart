import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TopRatedMovieCard extends StatelessWidget {
  TopRatedMovieCard({this.movie, this.position}) : super();

  final Movie movie;
  final int position;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(this.movie.title),
          subtitle: SmoothStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: (this.movie.popularity / 10),
            size: 22.0,
          ),
          leading: Image.network(
            "http://image.tmdb.org/t/p/w185/${this.movie.posterPath}",
          ),
          trailing: Text("#$position"),
        ),
      );
}
