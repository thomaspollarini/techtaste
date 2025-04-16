import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;
  const DishWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DishScreen(dish: dish);
            },
          ),
        );
      */
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/dishes/default.png"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  dish.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.highlightText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "R\$${dish.price.toStringAsFixed(2)}",
                  style: TextStyle(color: AppColors.textCards),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  dish.description.contains(".")
                      ? dish.description.substring(
                        0,
                        dish.description.indexOf(".") + 1,
                      )
                      : dish.description,
                  style: TextStyle(color: AppColors.textCards),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
