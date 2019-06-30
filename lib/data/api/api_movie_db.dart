import 'dart:convert';

import 'package:flutter_sample_app/data/models/popular_movies_model.dart';
import 'package:http/http.dart';

import 'api_constants.dart';

Future<Movies> getPopularMovies() async {
  final response = await get("$BASE_URL/movie/popular?api_key=$API_KEY");

  print(response.body);

  if (response.statusCode == 200) {
    return Movies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Something went wrong fetching popular movies");
  }
}

Future<Movies> getTopRatedMovies() async {
  final response = await get("$BASE_URL/movie/top_rated/?api_key=$API_KEY");

  print(response.body);

  if (response.statusCode == 200) {
    return Movies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Something went wrong fetching top rated movies");
  }
}
