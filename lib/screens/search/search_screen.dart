import "package:flutter/material.dart";
import "package:movieapp/components/movielist.dart";
import "package:movieapp/models/movie.dart";
import "package:movieapp/repository/movies_repo.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> movies = [];

  Future _searchMovies(query) async {
    updateList(await searchMovies(query));
  }

  void updateList(List<Movie> value) {
    setState(() {
      movies = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
          child: Column(
            children: [
              SearchBar(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                leading: const Icon(Icons.search),
                hintText: "Search for a movie...",
                onSubmitted: (value) => _searchMovies(value),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: MovieList(movies: movies),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
