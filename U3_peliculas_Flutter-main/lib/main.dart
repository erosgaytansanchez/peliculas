/*
Unidad 3:
  Vamos a consumir una API de IMDB
  Consumir servicios HTTP
    (Esta unidad) Aplicacion de Consumir GET,POST,PUT,DELETe (API a consumir)
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u3_peliculas/providers/movie_provider.dart';
import 'package:u3_peliculas/screens/screen.dart'; // Para no tener todos los imports

void main() {
  // CAMBIAMOS EL WIDGET INICIAL CON EL CORRE LA APLICACION ahora con el APPSATATE
  // Que se eejcute primero ql que consume los serivicos y despues el APP
  runApp(const AppState());
}

// DESPUES DE CONFIGURAR EL PROVEDOR HAY QUE CONFIGURAR EL MAIN
// PARA MANEJAR EL ESTAODO DE LA APLICACION EN EL CONSUMO DE L AAPI Y HTTP
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    // Cada provider es un srvicio que consumamos de la pai
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Aqui mandamos a llamar los provedores qu tengamos
          create: (_) => MoviesProvider(),
          // Aqui solo lo creamos, No lo mandamos a llamar (Como testing lo pusimos en el constructor)
          // Como queremos saber si Funciona le indicamos que se ejecute
          lazy: false,
        )
      ],
      // En segundo lugar se ejecutar ya la aplicacions
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      // Con este podmeos ponder el tema oscuro
      // con copy() podemo modificar el mapa por defecto
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
      initialRoute: 'home', // Ponemos el indentificador creado en el mapra
      // El home es la primera pantalla (Estas estan en su caprte)
      // Crear un sistema de rutas
      routes: {
        // La funcion anonima con _ es por el context (Todabia no vamos a poner el context pero lo dejamos asi como pendiente)
        // (Este guarda todo el arbol de widgets asi navegamos entre widgets)
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      }, // Por ser coleccion abrimos llaves y un mapa
    );
  }
}
