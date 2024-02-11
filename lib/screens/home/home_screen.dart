import "package:flutter/material.dart";
import 'package:logging/logging.dart';
import 'package:movieapp/components/carousel.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_id.dart';
import 'package:movieapp/repository/movies_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final log = Logger('Movies');

  List<Movie> carouselMovies = [];

  List<Movie> popularMovies = [];

  List<Movie> latestMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future _loadMovies() async {
    carouselMovies = await getCarouselMovies();
    popularMovies = await getPopularMovies();
    latestMovies = await getLatestMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _loadMovies(),
          builder: (context, snapshot) {
            // if fetching done
            if (snapshot.connectionState == ConnectionState.done) {
              List<String> carouselImageUrl = [];
              for (var movie in carouselMovies) {
                carouselImageUrl.add(movie.imageUrl.toString());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    PosterCarousel(imagesUrl: carouselImageUrl),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CategoriesBar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Popular",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("See all"))
                            ],
                          ),
                          PosterCardSlider(
                            movies: popularMovies,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Latest Movies",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("See all"))
                            ],
                          ),
                          PosterCardSlider(
                            movies: latestMovies,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class CategoriesBar extends StatelessWidget {
  CategoriesBar({super.key});

  final List<String> categoryTitles = [
    "Action",
    "Romance",
    "Comedy",
    "Sci-Fi",
    "Fantasy",
    "Horror",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Category(
            title: categoryTitles[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category(
      {super.key, required this.title, this.backgroundColor, this.onTap});

  final String title;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Center(
                child: Text(title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PosterCardSlider extends StatelessWidget {
  final List<Movie> movies;

  const PosterCardSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: MovieId(movieId: movies[index].id.toString()));
                },
                child: Container(
                  width: 135,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image:
                              NetworkImage(movies[index].imageUrl.toString()),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            );
          }),
    );
  }
}
