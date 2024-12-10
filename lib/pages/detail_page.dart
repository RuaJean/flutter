import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // Para ocupar todo el ancho y facilitar el centrado
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Centrar el contenido verticalmente en el contenedor
            mainAxisAlignment: MainAxisAlignment.center,
            // Alinear el contenido horizontalmente al centro
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              movie.poster.isNotEmpty
                  ? Image.network(
                      movie.poster,
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.movie, size: 100),
              SizedBox(height: 16),
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center, // Para centrar el texto
              ),
              SizedBox(height: 8),
              Text(
                'Año: ${movie.year}',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
