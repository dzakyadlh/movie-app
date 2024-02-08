import "package:flutter/material.dart";

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  String query = "";

  void updateList(String value) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
      leading: Icon(Icons.search),
      hintText: "Search for a movie...",
    );
  }
}
