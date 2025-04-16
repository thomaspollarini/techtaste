import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: Center(
        child: Column(
          spacing: 12,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 150),
            Text(
              "Mais pedidos",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Column(),
          ],
        ),
      ),
    );
  }
}
