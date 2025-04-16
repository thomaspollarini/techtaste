import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/checkout/widgets/dish_cart_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: bagProvider.clearBag,
            child: Text("Limpar", style: TextStyle(color: AppColors.mainColor)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pedido",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.highlightText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                spacing: 12,
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return DishCartWidget(dish: dish);
                  },
                ),
              ),
              Text(
                "Confirmar",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.highlightText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 190,
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 12.0,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Pedido:",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Text(
                            'R\$ ${bagProvider.getTotalPrice().toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.highlightText,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Entrega:",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Text(
                            'R\$ ${(bagProvider.getTotalPrice() * 0.15).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.highlightText,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Text(
                            'R\$ ${(bagProvider.getTotalPrice() * 1.15).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.highlightText,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: bagProvider.clearBag,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_bag, color: Colors.black),
                              Text("Pedir"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
