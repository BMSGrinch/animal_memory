import 'package:animalmemory/models/animals_data.dart';
import 'package:animalmemory/pages/detail_page.dart';
import 'package:animalmemory/widgets/animal_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF448AFF),
        title: Text(
          "Animal Memory",
          style: TextStyle(
            fontFamily: "Animals",
            fontSize: 60,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          final animal = animalList[index];
          return AnimalTile(
            animal: animal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(animal: animal)),
              );
            },
          );
        },
      ),
    );
  }
}
