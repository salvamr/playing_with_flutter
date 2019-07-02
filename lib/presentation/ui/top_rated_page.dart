import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_movie_db.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:flutter_sample_app/presentation/widgets/top_rated_movie_card.dart';

import 'loading_page.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const BottomNavigationBarItem bottomBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.star),
    title: Text("Top rated"),
  );

  @override
  State createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  ListView _printTopRatedMovies(AsyncSnapshot<MovieResult> snapshot) {
    snapshot.data.results.sort((a, b) => b.popularity.compareTo(a.popularity));
    return ListView(
        children: snapshot.data.results
            .asMap()
            .map((index, result) {
              return MapEntry(
                  index,
                  TopRatedMovieCard(
                    movie: result,
                    position: index + 1,
                  ));
            })
            .values
            .toList());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Top Rated Movies"),
        ),
        body: FutureBuilder<MovieResult>(
          future: getTopRatedMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _printTopRatedMovies(snapshot);
            } else if (snapshot.hasError) {
              return SnackBar(
                content: Text(snapshot.error.toString()),
              );
            } else {
              return LoadingPage();
            }
          },
        ),
      );
}
