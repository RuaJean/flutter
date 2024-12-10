import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieListItem({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.poster.isNotEmpty
          ? Image.network(movie.poster, width: 50, fit: BoxFit.cover)
          : Icon(Icons.movie),
      title: Text(movie.title),
      subtitle: Text(movie.year),
      onTap: onTap,
    );
  }
}
