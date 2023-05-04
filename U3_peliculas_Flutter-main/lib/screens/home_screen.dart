import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u3_peliculas/providers/movie_provider.dart';
import 'package:u3_peliculas/widgets/widgets.dart';

// Vamos aintenrtar crear stleess widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colocamos l instnacia de movieprovider (Nececitamos meterlo dentro de un Provider)
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      // Estos tienen acciones
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ],
        title: const Center(
          child: Text('Peliculas'),
        ),
      ),
      body: //null, //TODO: Crear un widget de Tarjeta (Es por hacer)
          // Por columnas organizaremos el home screen
          SingleChildScrollView(
        // PAra que no salga error hay que poner un scroll
        child: Column(
          // CardSeper es el que esta arriba
          // El otro es el que esta abajo
          children: [
            CardSwiper(
              // En movie provider nos manda la lista de peliculas que es donde consumimos la AP
              // Hay que saber el metodo del provider que nos da la lista de peliculas
              movies: moviesProvider.onGetNowPlaying,
            ),
            MovieSlider(
              // Resibimos las peliculas populares
              movies: moviesProvider.popularMovies,
              //*********************************************************************************************Aqui nos qiedamos en la clase************************* */
              //titulo: 'Populares',
            )
          ],
        ),
      ),
    );
  }
}
