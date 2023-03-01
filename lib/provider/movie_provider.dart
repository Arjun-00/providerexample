import 'dart:math';
import 'package:flutter/material.dart';
import '../models/movie_model.dart';

final List<Movies> initialData = List.generate(50,
        (index) => Movies(movieName: "Movies $index",movieTitle: "${Random().nextInt(100)+60} minutes")
);

class MovieProvider with ChangeNotifier{
  final List<Movies> _movies = initialData;
  List<Movies> get movier => _movies;

  final List<Movies> _cartList = [];
  List<Movies> get myList => _cartList;

  void addItem(Movies movie){
    _cartList.add(movie);
    notifyListeners();
  }
  void removeItems(Movies movies){
    _cartList.remove(movies);
    notifyListeners();
  }
  void removeCartItem(Movies movies){
    _cartList.remove(movies);
    notifyListeners();
  }
}