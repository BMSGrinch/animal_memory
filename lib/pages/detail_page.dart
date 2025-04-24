import 'package:animalmemory/models/animal.dart';
import 'package:animalmemory/providers/animal_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;

  const DetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF448AFF),
        title: Text(
          animal.name,
          style: TextStyle(
            fontFamily: "Animals",
            fontSize: 60,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFFFDE7),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(animal.image, height: 200, width: 200),
            const SizedBox(height: 16),
            Text(
              animal.name,
              style: const TextStyle(fontSize: 16, color: Color(0xFF212121)),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                animalProvider.toggleFavorite(animal.id);
              },
              icon: Icon(
                animalProvider.isFavorite(animal.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
              ),
              label: Text(
                animalProvider.isFavorite(animal.id)
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA726),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
