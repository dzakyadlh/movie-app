import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:movieapp/models/movie.dart';

final log = Logger('Movies');

Future getCarouselMovies() async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http.get(
        Uri.parse(
            '$apiUrl/titles?limit=5&info=base_info&year=2023&genre=Action'),
        headers: {
          "X-RapidAPI-Key": apiKey,
          "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        });
    var jsonData = jsonDecode(response.body);

    List<Movie> movies = [];

    for (var eachMovie in jsonData['results']) {
      var id = eachMovie['id'];
      var name = eachMovie['titleText']['text'];
      var imageUrl = eachMovie['primaryImage']['url'];
      var casts = 'No info';
      var category = eachMovie['titleType']['text'];
      List<String> genres = [];
      for (var genre in eachMovie['genres']['genres']) {
        genres.add(genre['text']);
      }
      var releaseYear = eachMovie['releaseYear']['year'].toString();
      final movie = Movie(
          id: id,
          name: name,
          imageUrl: imageUrl,
          casts: casts,
          category: category,
          genre: genres,
          releaseYear: releaseYear);
      movies.add(movie);
    }
    return movies;
  } catch (e) {
    return log.severe('Error: $e');
  }
}

Future getPopularMovies() async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http.get(
        Uri.parse(
            '$apiUrl/titles/random?titleType=movie&info=base_info&endYear=2023&list=top_boxoffice_last_weekend_10'),
        headers: {
          "X-RapidAPI-Key": apiKey,
          "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        });
    var jsonData = jsonDecode(response.body);

    List<Movie> movies = [];

    for (var eachMovie in jsonData['results']) {
      var id = eachMovie['id'];
      var name = eachMovie['titleText']['text'];
      var imageUrl = eachMovie['primaryImage']['url'];
      var casts = 'No info';
      var category = eachMovie['titleType']['text'];
      List<String> genres = [];
      for (var genre in eachMovie['genres']['genres']) {
        genres.add(genre['text']);
      }
      var releaseYear = eachMovie['releaseYear']['year'].toString();
      final movie = Movie(
          id: id,
          name: name,
          imageUrl: imageUrl,
          casts: casts,
          category: category,
          genre: genres,
          releaseYear: releaseYear);
      movies.add(movie);
    }
    return movies;
  } catch (e) {
    return log.severe('Error: $e');
  }
}

Future getLatestMovies() async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http.get(
        Uri.parse(
            '$apiUrl/titles?titleType=movie&endYear=2022&info=base_info&limit=10'),
        headers: {
          "X-RapidAPI-Key": apiKey,
          "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        });
    var jsonData = jsonDecode(response.body);

    List<Movie> movies = [];

    for (var eachMovie in jsonData['results']) {
      var id = eachMovie['id'];
      var name = eachMovie['titleText']['text'];
      var imageUrl = eachMovie['primaryImage']['url'];
      var casts = 'No info';
      var category = eachMovie['titleType']['text'];
      List<String> genres = [];
      for (var genre in eachMovie['genres']['genres']) {
        genres.add(genre['text']);
      }
      var releaseYear = eachMovie['releaseYear']['year'].toString();
      final movie = Movie(
          id: id,
          name: name,
          imageUrl: imageUrl,
          casts: casts,
          category: category,
          genre: genres,
          releaseYear: releaseYear);
      movies.add(movie);
    }
    return movies;
  } catch (e) {
    return log.severe('Error: $e');
  }
}

Future searchMovies(String query) async {
  try {
    await dotenv.load(fileName: "config.env");
    String apiUrl = 'https://moviesdatabase.p.rapidapi.com';
    String apiKey = dotenv.get("API_KEY");

    var response = await http.get(
        Uri.parse(
            '$apiUrl/titles/search/title/$query?exact=false&info=base_info&endYear=2022&sort=year.incr&titleType=movie'),
        headers: {
          "X-RapidAPI-Key": apiKey,
          "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        });
    var jsonData = jsonDecode(response.body);

    List<Movie> movies = [];

    for (var eachMovie in jsonData['results']) {
      var id = eachMovie['id'];
      var name = eachMovie['titleText']['text'];
      var imageUrl = eachMovie['primaryImage']['url'];
      var casts = 'No info';
      var category = eachMovie['titleType']['text'];
      List<String> genres = [];
      for (var genre in eachMovie['genres']['genres']) {
        genres.add(genre['text']);
      }
      var releaseYear = eachMovie['releaseYear']['year'].toString();
      final movie = Movie(
          id: id,
          name: name,
          imageUrl: imageUrl,
          casts: casts,
          category: category,
          genre: genres,
          releaseYear: releaseYear);
      movies.add(movie);
    }
    return movies;
  } catch (e) {
    return log.severe('Error: $e');
  }
}
