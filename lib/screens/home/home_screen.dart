import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // get popular
  // Future getPopularLocations() async{
  //   var url = Uri.https('https://opentripmap-places-v1.p.rapidapi.com', '/places/geoname')
  //   var response = await http.get();
  // }
  // get new and noteworthy

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tokyo, Japan"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.location_pin)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HomeSearchBar(),
              CategoriesBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              BigCardSlider(),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "New and Noteworthy",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  CardItemsList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
      leading: Icon(Icons.search),
      hintText: "Find places to visit...",
    );
  }
}

class CategoriesBar extends StatelessWidget {
  CategoriesBar({super.key});

  final List<String> categoryTitles = [
    "Locations",
    "Hotels",
    "Restaurants",
    "Cafes",
    "Beaches",
    "Malls",
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

class BigCardSlider extends StatelessWidget {
  BigCardSlider({super.key});

  final List<String> popularNames = [
    "Locations",
    "Hotels",
    "Restaurants",
    "Cafes",
    "Beaches",
    "Malls",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
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
                  width: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/shibuyacrossing.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black45,
                        ),
                        child: const Text(
                          "Shibuya Crossing",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black45,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                  size: 10,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CardItemsList extends StatelessWidget {
  CardItemsList({super.key});

  final List<String> names = [
    "Immersive Fort Tokyo",
    "Senkyaku Banrai Toyosu Manyo Club Onsen",
    "Warner Bros. Studio Tour Tokyo",
    "Art Aquarium",
    "Miyashita Park",
    "Super Nintendo World"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Padding(
          padding:
              const EdgeInsets.only(bottom: 4.0), // Add space between each card
          child: InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/shibuyacrossing.jpg",
                          fit: BoxFit
                              .cover, // Use cover to maintain aspect ratio
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Add space between image and text
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            names[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text("Tokyo, Japan")
                        ],
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Add space between text and rating
                    const Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          Text("4.5")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
