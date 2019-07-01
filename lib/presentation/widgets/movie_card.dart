import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  MovieCard({this.title, this.voteCount, this.imageUrl}) : super();

  final String title;
  final String voteCount;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
            title: Text(this.title),
            subtitle: Text("Votes: ${this.voteCount}"),
            trailing: Image.network(
              "http://image.tmdb.org/t/p/w185/${this.imageUrl}",
            )),
      );
}
