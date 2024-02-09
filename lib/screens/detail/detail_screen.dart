import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
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
  String movieId = "tt21344706";

  @override
  void initState() {
    super.initState();
    _getMovieById(movieId);
  }

  Future _getMovieById(String movieId) async {
    movie = await getMovieById(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: FutureBuilder(
              future: _getMovieById(movieId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Image.network(
                        movie.imageUrl.toString(),
                        fit: BoxFit.fitHeight,
                      ),
                      ListTile(
                          leading: Text(
                            movie.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 28),
                          ),
                          trailing:
                              RatingSection(rating: movie.rating.toString())),
                      const ButtonSection(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.plot.toString(),
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: movie.genre.length,
                                itemBuilder: (_, index) {
                                  return Text("${movie.genre[index]} ");
                                }),
                            const SizedBox(
                              height: 4,
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
      padding: EdgeInsets.all(8),
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
