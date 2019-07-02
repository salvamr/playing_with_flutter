import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:http/http.dart';

import 'api_constants.dart';

Future<MovieResult> getPopularMovies() async {
  final response = await get("$BASE_URL/movie/popular?api_key=$API_KEY");

  print(response.body);

  if (response.statusCode == 200) {
    return resultMoviesFromJson(response.body);
  } else {
    throw Exception("Something went wrong fetching popular movies");
  }
}

Future<MovieResult> getTopRatedMovies() async {
  final response = await get("$BASE_URL/movie/top_rated/?api_key=$API_KEY");

  print(response.body);

  if (response.statusCode == 200) {
    return resultMoviesFromJson(response.body);
  } else {
    throw Exception("Something went wrong fetching top rated movies");
  }
}
