import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_id.dart';

class MovieList extends StatefulWidget {
  MovieList({super.key, required this.movies});

  List<Movie> movies = [];

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies =
        widget.movies.where((movie) => movie.imageUrl != "null").toList();
    if (widget.movies.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Center(
          child: Text(
            "Movie not found. Please try again",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            filteredMovies[index].name.toString(),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            filteredMovies[index].releaseYear.toString(),
            style: const TextStyle(fontSize: 12),
          ),
          leading: SizedBox(
            width: 40, // Adjust the width as needed
            child: Image.network(
              filteredMovies[index].imageUrl.toString(),
              fit: BoxFit.fill,
            ),
          ),
          trailing: Text(
            filteredMovies[index].rating.toString(),
            style: const TextStyle(color: Color.fromRGBO(50, 168, 115, 1)),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/detail',
                arguments:
                    MovieId(movieId: filteredMovies[index].id.toString()));
          },
        ),
      );
    }
  }
}
