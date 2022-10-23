import 'package:flutter/material.dart';
import 'package:pop_movies/pop_movies_app.dart';
import 'package:pop_movies/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init(); //initializing Dependency Injection

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieProvider>.value(value: MovieProvider()),
      ],
      child: const PopMovies(),
    ),
  );
}
