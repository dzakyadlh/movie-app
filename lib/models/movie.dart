class Movie {
  String? id;
  String? name;
  String? imageUrl;
  String? casts;
  String? category;
  List<String?> genre;
  String? releaseYear;
  double? rating;

  Movie({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.casts,
    required this.category,
    required this.genre,
    required this.releaseYear,
    required this.rating,
  });
}
