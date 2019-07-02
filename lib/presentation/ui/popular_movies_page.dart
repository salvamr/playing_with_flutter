import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_movie_db.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:flutter_sample_app/presentation/widgets/popular_movie_card.dart';

import 'loading_page.dart';

class PopularMoviesPage extends StatefulWidget {
  static const BottomNavigationBarItem bottomBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.movie),
    title: Text("Popular"),
  );

  @override
  State createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMoviesPage> {
  ListView _printPopularMovies(AsyncSnapshot<MovieResult> snapshot) => ListView(
          children: snapshot.data.results.map((result) {
        return PopularMovieCard(
          movie: result,
        );
      }).toList());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: FutureBuilder<MovieResult>(
          future: getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _printPopularMovies(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return LoadingPage();
            }
          },
        ),
      );
}
