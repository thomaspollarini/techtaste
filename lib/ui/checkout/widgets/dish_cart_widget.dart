import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class DishCartWidget extends StatelessWidget {
  final Dish dish;
  const DishCartWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  'assets/dishes/default.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: const TextStyle(
                        color: AppColors.highlightText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "R\$${dish.price.toStringAsFixed(2)} ",
                      style: TextStyle(color: AppColors.textCards),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    bagProvider.removeDish(dish);
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  bagProvider.getMapByAmount()[dish].toString(),
                  style: TextStyle(fontSize: 18.0),
                ),
                IconButton(
                  onPressed: () {
                    bagProvider.addAllDishes([dish]);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
