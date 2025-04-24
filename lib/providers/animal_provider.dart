import 'package:animalmemory/models/animals_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/animal.dart';

class AnimalProvider with ChangeNotifier {
  final List<Animal> _animals = animalList;
  final Set<String> _favorites = {};

  // Getters
  List<Animal> get animals => _animals;
  
  List<Animal> get favorites => 
      _animals.where((animal) => _favorites.contains(animal.id)).toList();
  
  bool isFavorite(String id) => _favorites.contains(id);

  // Initialisation des favoris depuis SharedPreferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites
      ..clear()
      ..addAll(prefs.getStringList('favorites') ?? []);
    notifyListeners();
  }

  // Ajouter ou supprimer un animal des favoris
  void toggleFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
    _saveFavorites();
  }

  // Sauvegarder les favoris dans SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favorites.toList());
  }
}