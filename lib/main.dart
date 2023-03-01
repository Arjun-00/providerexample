import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/provider/movie_provider.dart';
import 'package:providerexample/screens/homescreen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (_) => MovieProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider StateManagement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}