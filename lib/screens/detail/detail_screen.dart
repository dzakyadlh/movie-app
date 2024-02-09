import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Detail"), backgroundColor: Colors.greenAccent),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageSection(image: "assets/images/shibuyacrossing.jpg"),
            HeaderSection(
                name: "Shibuya Crossing",
                location: "Tokyo, Japan",
                rating: 4.8),
            BodySection(
                description:
                    "Shibuya Crossing is like the bustling heart of Tokyo. Picture this: a massive intersection with pedestrian crossings in all directions, surrounded by neon lights, giant screens, and a sea of people. It's a symbol of the vibrant and energetic atmosphere of Shibuya, one of Tokyo's trendiest and busiest districts. The crossing itself is iconic, especially when all the lights turn red, and pedestrians surge into the intersection from every corner, creating a mesmerizing spectacle. It's a must-see if you're ever in Tokyo!"),
            RatingSection(rating: null),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
  });

  final String name;
  final String location;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                location,
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text(rating.toString()),
        ],
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class RatingSection extends StatefulWidget {
  const RatingSection({super.key, required this.rating});

  final double? rating;

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  bool isRated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text("Rate this place"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                IconButton(
                  icon: isRated
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border),
                  color: isRated ? Colors.red : Colors.black,
                  onPressed: () {
                    setState(() {
                      isRated = !isRated;
                    });
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
