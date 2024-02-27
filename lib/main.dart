import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rc_movies/screens/screens.dart';
import 'package:flutter_rc_movies/providers/movies_provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Movies RC',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'details': (context) => const DetailsScreen(),
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue[900],
              actionsIconTheme:
                  const IconThemeData(color: Colors.white, size: 30),
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25)),
        ));
  }
}
