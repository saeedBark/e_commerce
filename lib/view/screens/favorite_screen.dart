import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites',
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
