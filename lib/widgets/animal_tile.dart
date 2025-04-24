import 'package:animalmemory/models/animal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalTile({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);

    return ListTile(
      leading: Image.asset(animal.image, width: 40, height: 40),
      title: Text(animal.name),
      trailing: IconButton(
        onPressed: () {
          animalProvider.toggleFavorite(animal.id);
        },
        icon: Icon(
          animalProvider.isFavorite(animal.id)
              ? Icons.favorite
              : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      onTap: onTap,
    );
  }
}
