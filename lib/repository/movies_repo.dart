import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:movieapp/models/movie.dart';

final log = Logger('Movies');

Future<List<Movie>> getCarouselMovies() async {
  return getMovies('/titles?limit=5&year=2023&genre=Action');
}

Future<List<Movie>> getPopularMovies() async {
  return getMovies(
      '/titles/random?titleType=movie&endYear=2023&list=top_boxoffice_last_weekend_10');
}

Future<List<Movie>> getLatestMovies() async {
  return getMovies('/titles?titleType=movie&endYear=2022&limit=10');
}

Future<List<Movie>> searchMovies(String query) async {
  return getMovies(
      '/titles/search/title/$query?exact=false&info=base_info&endYear=2022&sort=year.incr&titleType=movie');
}

Future<List<Movie>> getMovies(String url) async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http.get(Uri.parse('$apiUrl$url'), headers: {
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    });
    var jsonData = jsonDecode(response.body);

    List<Movie> movies = [];

    for (var eachMovie in jsonData['results']) {
      var id = eachMovie['id']?.toString();
      var name = eachMovie['titleText']?['text']?.toString() ?? 'null';
      var imageUrl = eachMovie['primaryImage']?['url']?.toString() ?? 'null';
      var casts = 'casts';
      var category = 'category';
      List<String> genres = [];
      var releaseYear = eachMovie['releaseYear']?['year']?.toString() ?? 'null';
      var rating = eachMovie['ratingsSummary']?['aggregateRating'] ?? 0.0;
      var plot = 'plot';
      final movie = Movie(
        id: id,
        name: name,
        imageUrl: imageUrl,
        casts: casts,
        category: category,
        genre: genres,
        releaseYear: releaseYear,
        rating: rating,
        plot: plot,
      );
      movies.add(movie);
    }
    return movies;
  } catch (e) {
    log.severe('Error: $e');
    throw Exception('Failed to fetch movies');
  }
}

Future<Movie> getMovieById(String movieId) async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http
        .get(Uri.parse('$apiUrl/titles/$movieId?info=base_info'), headers: {
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    });
    var jsonData = jsonDecode(response.body);

    var id = jsonData['results']?['id'].toString();
    var name = jsonData['results']?['titleText']?['text']?.toString() ?? 'null';
    var imageUrl =
        jsonData['results']?['primaryImage']?['url']?.toString() ?? 'null';
    var casts = 'No info';
    var category =
        jsonData['results']?['titleType']['text']?.toString() ?? 'null';
    List<String> genres = [];
    for (var genre in jsonData['results']?['genres']?['genres'] ?? []) {
      genres.add(genre['text'].toString());
    }
    var releaseYear =
        jsonData['results']?['releaseYear']?['year']?.toString() ?? 'null';
    var rating =
        jsonData['results']?['ratingsSummary']?['aggregateRating'] ?? 0.0;
    var plot = jsonData['results']?['plot']?['plotText']?['plainText'] ?? '-';
    final movie = Movie(
        id: id,
        name: name,
        imageUrl: imageUrl,
        casts: casts,
        category: category,
        genre: genres,
        releaseYear: releaseYear,
        rating: rating,
        plot: plot);
    return movie;
  } catch (e) {
    log.severe('Error: $e');
    throw Exception('Failed to fetch movie data');
  }
}
