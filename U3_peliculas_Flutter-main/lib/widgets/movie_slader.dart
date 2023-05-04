import 'package:flutter/material.dart';
import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  // Agregar las peliculas populares
  // Al agregar la propiedad la tenems que agregar al constructor
  final List<Movie> movies;
  final String? titulo;
  /******************************************************************************************************************** */

  const MovieSlider({super.key, required this.movies, this.titulo});

  @override
  Widget build(BuildContext context) {
    // Implementar media query (Sacar el tamano de la pantalla)
    final size = MediaQuery.of(context).size;

    return Container(
      // Tenga todo el ancho
      width: double.infinity,
      height: size.height * 0.3, // Alto del
      child: Column(
        // Orietacion
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Dar la separacion
          SizedBox(
            height: 5,
          ),
          // Expanded para que ocupe todod el tamano de la columa
          Expanded(
              child: ListView.builder(
            itemCount: movies
                .length, // Tamano del carrusel (YA no queremos que sea fijo, la lista trae las peliculas),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) =>
                _MoviePoster(index: index, movies: movies),
          )),
        ],
      ),
    );
  }
}

// PAra movie poster
// Estamos hacciendo el carrusel de abajo
class _MoviePoster extends StatelessWidget {
  final int index;
  // Al agregar la propiedad la tenems que agregar al constructor
  final List<Movie> movies;

  const _MoviePoster({super.key, required this.index, required this.movies});

  @override
  Widget build(BuildContext context) {
    final movie = movies[index];
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          // Para hacer tab (Nos mande a DetallesPEliculas)
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Poneer el Texto (Primero ponemos la separacion)
          SizedBox(
            height: 5,
          ),
          // Si el texto es muy largo para que no de errro hay que ponerle ...
          Text(
            movie.titleMovie,
            //"HOLALALALALALAALAL",
            maxLines: 2, // Cuando se parta en 2
            overflow: TextOverflow.ellipsis, // Ponga ... cuando se corte
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/** Tarea que slaga en la pantalla lo demas de la otra pantalla **/
