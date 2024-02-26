import 'package:flutter/material.dart';
import 'package:flutter_rc_movies/screens/screens.dart';

void main() {
  runApp(const MyApp());
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
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25)),
        ));
  }
}
