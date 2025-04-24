import 'package:animalmemory/providers/animal_provider.dart';
import 'package:animalmemory/widgets/animal_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/animal.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: Color(0xFF448AFF),
        title: Text(
          "Mes animaux",
          style: TextStyle(
            fontFamily: "Animals",
            fontSize: 60,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AnimalProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favorites;

          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: const Color(0xFFBDBDBD),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Aucun animal favori",
                    style: TextStyle(color: const Color(0xFF757575)),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final Animal animal = favorites[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: AnimalTile(
                  animal: animal,
                  onTap: () {
                    Navigator.pushNamed(context, "/details", arguments: animal);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
