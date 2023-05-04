import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  // Al agregar la propiedad la tenems que agregar al constructor
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // context trae todas las ramas de widget hasta los que hemos echo (Tambien almacena valores interesados como el tamano de la pantalla)
    final size =
        MediaQuery.of(context).size; // Aqui obtenemos el tamano de la pantalla
    return Container(
      // Tomar todo el ancho de la pantalla
      width: double.infinity,
      height:
          size.height * 0.5, // Para tener el 50% lo multiplicamos por el 0.5
      // Hijo del container
      child: Swiper(

          // Nececita esto de una API (NUm de tarjetas)
          itemCount: movies
              .length, // Tamano del carrusel (YA no queremos que sea fijo, la lista trae las peliculas)

          layout: SwiperLayout.STACK, // Tipo de carrusel
          itemWidth: size.width * 0.6, // Ancho
          itemHeight: size.height * 0.4, // ALto
          // Aqui nos va a llegar la imagen
          itemBuilder: (_, index) {
            // Variable para empezar a recorrer la lista
            // Como estamos dentro del forech (en cada pocicion tomamos la pelicula)
            final movie = movies[index];
            //Hay que saber en cual atributo esta la ruta de la imagen en el JSON
            // Segun la documentacion de la api la imagen se recibo son una URL+JSOn
            //print(movie.posterPath);
            // Aqui ponemos lo que queremos que se conctruya en la tarjeta (EL contenido)
            // Para detectar al dar click en la tarjeta
            return GestureDetector(
                // Tiene varios eventos
                onTap: () => Navigator.pushNamed(
                      context,
                      'details',
                      arguments: movie, // Le podemos pasar argumentos
                    ),
                // Hijo para ponerle imagenes
                child: ClipRRect(
                  // Este es para redondear los bordes
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    // el placeholder sale algo de carga miesntras no carga la imagen
                    placeholder: const NetworkImage(
                        'https://via.placeholder.com/300x400'), // Web api que nos va a descargar una imagen
                    image: NetworkImage(movie.fullPosterImg),
                    // La imagen toma la forma del contenedor padre (Que es el CLlipRReact que es el que le pusimos los bordes redondeados)
                    fit: BoxFit.cover,
                  ),
                ) // Este nos hace una transision de entrada al cambiar de imagen,
                );
          }),
    );
  }
}
