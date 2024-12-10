import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController(text: 'batman');

  @override
  void initState() {
    super.initState();
    // Cargar datos iniciales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieProvider>().loadMovies(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MovieProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Buscar película...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    provider.loadMovies(_controller.text);
                  },
                  child: Text('Buscar'),
                )
              ],
            ),
          ),

          Expanded(
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.movies.length,
                    itemBuilder: (context, index) {
                      final movie = provider.movies[index];
                      return MovieListItem(
                        movie: movie,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: movie,
                          );
                        },
                      );
                    },
                  ),
          ),

          // Footer 
          Container(
            padding: EdgeInsets.all(16),
            child: Text('Xolit - Derechos Reservados'),
          ),
        ],
      ),
    );
  }
}
