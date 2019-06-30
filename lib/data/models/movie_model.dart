import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  String posterPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  int id;
  String title;
  int voteCount;
  double voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.id,
    this.title,
    this.voteCount,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        id: json["id"],
        title: json["title"],
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "id": id,
        "title": title,
        "vote_count": voteCount,
        "vote_average": voteAverage,
      };
}
