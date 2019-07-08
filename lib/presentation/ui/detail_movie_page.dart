import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_movie_db.dart';
import 'package:flutter_sample_app/data/models/detail_movie_model.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';

import 'loading_page.dart';

class DetailMoviePage extends StatelessWidget {
  DetailMoviePage({this.movie}) : super();

  final Movie movie;

  Widget _printMovieDetail(MovieDetail movie) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Image.network(
            "http://image.tmdb.org/t/p/w400/${movie.posterPath}",
            height: 300.0,
            width: 300.0,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            movie.title,
            style: TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Text(
            movie.originalTitle,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(movie.overview),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: FutureBuilder<MovieDetail>(
        future: getMovieDetail(movie.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _printMovieDetail(snapshot.data);
          } else {
            return LoadingPage();
          }
        },
      ),
    );
  }
}
