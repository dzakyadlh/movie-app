import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_id.dart';
import 'package:movieapp/repository/movies_repo.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Movie movie = Movie(
    id: "id",
    name: "name",
    imageUrl: "imageUrl",
    casts: "casts",
    category: "category",
    genre: [],
    releaseYear: "releaseYear",
    rating: 0.0,
    plot: "plot",
  );

  // @override
  // void initState() {
  //   super.initState();
  //   _getMovieById(movieId);
  // }

  Future _getMovieById(String movieId) async {
    movie = await getMovieById(movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as MovieId;
    _getMovieById(movieId.movieId.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: FutureBuilder(
              future: _getMovieById(movieId.movieId.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Image.network(
                        movie.imageUrl.toString(),
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.name.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 28),
                            ),
                            const ButtonSection(),
                            Text(
                              movie.plot.toString(),
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(movie.genre.join(', ')),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Released on ${movie.releaseYear}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white54),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            rating,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DetailButton(btnIcon: Icons.add, btnText: "Watchlist"),
          DetailButton(btnIcon: Icons.favorite_outline, btnText: "Favorite"),
          DetailButton(btnIcon: Icons.download_outlined, btnText: "Download")
        ],
      ),
    );
  }
}

class DetailButton extends StatelessWidget {
  const DetailButton({super.key, required this.btnIcon, required this.btnText});

  final IconData btnIcon;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4),
      child: Column(
        children: [
          Icon(
            btnIcon,
            size: 28,
            color: Colors.white,
          ),
          Text(
            btnText,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
