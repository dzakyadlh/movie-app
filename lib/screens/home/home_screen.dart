import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:movieapp/components/carousel.dart';
import 'package:movieapp/models/movie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final log = Logger('MyClassName');

  // get popular
  Future getUpcomingMovies() async {
    // log.info('Hello there!');

    // try {
    //   await dotenv.load(fileName: "config.env");
    //   String apiKey = dotenv.get("API_KEY");

    //   log.info('API Key: $apiKey');

    //   var response = await http.get(
    //       Uri.https(
    //         'moviesdatabase.p.rapidapi.com',
    //         'movie/byYear/2021/',
    //       ),
    //       headers: {HttpHeaders.authorizationHeader: apiKey});
    //   log.info('API Response: $response');
    // } catch (e) {
    //   log.severe('Error: $e');
    // }
    print('Hello there!');

    try {
      await dotenv.load(fileName: "config.env");
      String apiKey = dotenv.get("API_KEY");

      print('API Key: $apiKey');

      var response = await http.get(
          Uri.https(
            'moviesdatabase.p.rapidapi.com',
            'titles?year=2022&genre=Action&info=base_info',
          ),
          headers: {
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
          });
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      // for (var eachMovie in jsonData["results"]) {
      //   final movie = Movie(
      //       id: eachMovie["id"],
      //       name: eachMovie["titleText"]["text"],
      //       imageUrl: eachMovie["primaryImage"]["url"],
      //       casts: "",
      //       category: "category",
      //       genre: "genre",
      //       releaseYear: "releaseYear");
      // }
    } catch (e) {
      print('Error: $e');
    }
  }
  // get new and noteworthy

  final List<String> sliderImages = [
    "https://m.media-amazon.com/images/M/MV5BMTEwYjJhY2QtMDBlYS00NzNjLWJkMmMtYWFmNTkzZTI0YWMyXkEyXkFqcGdeQXVyMTM1ODg2MDk3._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BMzI0NmVkMjEtYmY4MS00ZDMxLTlkZmEtMzU4MDQxYTMzMjU2XkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BYzFiZjc1YzctMDY3Zi00NGE5LTlmNWEtN2Q3OWFjYjY1NGM2XkEyXkFqcGdeQXVyMTUyMTUzNjQ0._V1_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    getUpcomingMovies();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PosterCarousel(imagesUrl: sliderImages),
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
                      TextButton(onPressed: () {}, child: const Text("See all"))
                    ],
                  ),
                  const PosterCardSlider(),
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
                      TextButton(onPressed: () {}, child: const Text("See all"))
                    ],
                  ),
                  const PosterCardSlider()
                ],
              ),
            ),
          ],
        ),
      ),
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
  const PosterCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 135,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/shibuyacrossing.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            );
          }),
    );
  }
}
