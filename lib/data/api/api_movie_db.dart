import 'dart:convert';

import 'package:flutter_sample_app/data/models/detail_movie_model.dart';
import 'package:flutter_sample_app/data/models/movies_model.dart';
import 'package:http/http.dart';

import 'api_constants.dart';

Future<MovieResult> getPopularMovies() async {
  var uri =
      Uri.http(BASE_URL, "$API_VERSION/movie/popular", {"api_key": API_KEY});
  final response = await get(uri);

  print(response.body);

  if (response.statusCode == 200) {
    return resultMoviesFromJson(response.body);
  } else {
    throw _getApiErrorFromJson(response.body);
  }
}

Future<MovieResult> getTopRatedMovies() async {
  var uri =
      Uri.http(BASE_URL, "$API_VERSION/movie/top_rated", {"api_key": API_KEY});
  final response = await get(uri);

  print(response.body);

  if (response.statusCode == 200) {
    return resultMoviesFromJson(response.body);
  } else {
    throw _getApiErrorFromJson(response.body);
  }
}

Future<MovieDetail> getMovieDetail(int movieId) async {
  var uri =
      Uri.http(BASE_URL, "$API_VERSION/movie/$movieId", {"api_key": API_KEY});
  final response = await get(uri);

  print(response.body);

  if (response.statusCode == 200) {
    var x = MovieDetail.fromJson(json.decode(response.body));
    return x;
  } else {
    throw _getApiErrorFromJson(response.body);
  }
}

Exception _getApiErrorFromJson(String str) => _fromJson(json.decode(str));

Exception _fromJson(Map<String, dynamic> json) =>
    Exception(json["status_message"]);
