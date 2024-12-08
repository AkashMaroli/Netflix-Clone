import 'dart:convert';

import 'package:netflixclonesecond/models/movie_model.dart';
import 'package:netflixclonesecond/common/constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

static const upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';





  Future<List<MovieModel>> getTrendingMovies() async {
    //!trending url name is not a private
    final response = await http.get(Uri.parse(trendingUrl));
  //  print(response.statusCode);
    if (response.statusCode == 200) {
      final decordedData = json.decode(response.body)['results'] as List;
   //   print(decordedData);
      return decordedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
  
  Future<List<MovieModel>> getTopRatedMovies() async {
    //!trending url name is not a private
    final response = await http.get(Uri.parse(topRatedUrl));
   // print(response.statusCode);
    if (response.statusCode == 200) {
      final decordedData = json.decode(response.body)['results'] as List;
     // print(decordedData);
      return decordedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    //!trending url name is not a private
    final response = await http.get(Uri.parse(upcomingUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decordedData = json.decode(response.body)['results'] as List;
      print(decordedData);
      return decordedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

   Future<List<MovieModel>> getSearchMovies(String query) async {
    final searchMoviesUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$query';
    //!trending url name is not a private
    final response = await http.get(Uri.parse(searchMoviesUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decordedData = json.decode(response.body)['results'] as List;
      print(decordedData);
      return decordedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
