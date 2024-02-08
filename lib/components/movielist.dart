import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';

class MovieList extends StatefulWidget {
  MovieList({super.key, required this.movies});

  List<Movie> movies = [];

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
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
        itemCount: widget.movies.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(widget.movies[index].name.toString()),
          subtitle: Text(widget.movies[index].releaseYear.toString()),
          leading: Image.network(widget.movies[index].imageUrl.toString()),
        ),
      );
    }
  }
}
