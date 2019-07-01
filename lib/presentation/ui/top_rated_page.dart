import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/api/api_movie_db.dart';
import 'package:flutter_sample_app/data/models/popular_movies_model.dart';
import 'package:flutter_sample_app/presentation/widgets/movie_card.dart';

import 'loading_page.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const BottomNavigationBarItem bottomBarItem = BottomNavigationBarItem(
    icon: Icon(Icons.star),
    title: Text("Top rated movies"),
  );

  @override
  State createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  ListView _printTopRatedMovies(AsyncSnapshot<Movies> snapshot) => ListView(
          children: snapshot.data.results.map((result) {
        return MovieCard(
          title: result.title,
          imageUrl: result.posterPath,
          voteCount: result.voteCount.toString(),
        );
      }).toList());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Top Rated Movies"),
        ),
        body: FutureBuilder<Movies>(
          future: getTopRatedMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _printTopRatedMovies(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return LoadingPage();
            }
          },
        ),
      );
}
