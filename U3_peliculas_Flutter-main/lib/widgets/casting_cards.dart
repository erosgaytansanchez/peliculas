import 'package:flutter/material.dart';
import 'package:u3_peliculas/providers/movie_provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final Movie pelicula;
  final List<dynamic>? actors;

  const CastingCards({super.key, required this.pelicula, required this.actors});

  @override
  Widget build(BuildContext context) {
    // Implementar media query (Sacar el tamano de la pantalla)
    final size = MediaQuery.of(context).size;

    //final movieProvider = MoviesProvider();
    print("CAsting: ");
    //final actors = movieProvider.getActors(pelicula.id.toString());
    List<CastElement> castMovies = actors!.cast<CastElement>();
    print(castMovies[0].name);

    return Container(
      // Tenga todo el ancho
      width: double.infinity,
      height: size.height * 0.3, // Alto del
      child: Column(
        // Orietacion del TExto
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Actores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Dar la separacion
          SizedBox(
            height: 10,
          ),
          // Expanded para que ocupe todod el tamano de la columa
          Expanded(
              child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) =>
                _CastingPoster(castMovies: castMovies[index]),
          )),
        ],
      ),
    );
  }
}

// PAra movie poster
// Estamos hacciendo el carrusel de abajo
class _CastingPoster extends StatelessWidget {
  CastElement castMovies;
  _CastingPoster({super.key, required this.castMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: NetworkImage('https://via.placeholder.com/300x400'),
              image: NetworkImage(castMovies.getFoto()),
              width: 120,
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
          // Poneer el Texto (Primero ponemos la separacion)
          SizedBox(
            height: 5,
          ),
          // Si el texto es muy largo para que no de errro hay que ponerle ...
          Text(
            castMovies.name,
            maxLines: 2, // Cuando se parta en 2
            overflow: TextOverflow.ellipsis, // Ponga ... cuando se corte
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
