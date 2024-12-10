import 'package:flutter/foundation.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  final MovieService _movieService;

  MovieProvider(this._movieService);

  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> loadMovies(String query) async {
    _isLoading = true;
    notifyListeners();
    _movies = await _movieService.fetchMovies(query);
    _isLoading = false;
    notifyListeners();
  }
}
