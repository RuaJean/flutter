import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  final String apiKey = 'cc62c7cb';
  
  Future<List<Movie>> fetchMovies(String query) async {
    // Ej: https://www.omdbapi.com/?apikey=cc62c7cb&s=batman
    final url = Uri.parse('https://www.omdbapi.com/?apikey=$apiKey&s=$query');
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
        final List results = data['Search'];
        return results.map((item) => Movie.fromJson(item)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Error al obtener datos de la API');
    }
  }
}
