// Suggested code may be subject to a license. Learn more: ~LicenseLog:1936665194.
import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatefulWidget {
  final String restaurantName;
  final Dish dish;

  const DishScreen({
    super.key,
    required this.dish,
    required this.restaurantName,
  });

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int _quantity = 1;

  void _incrementQuantity() => setState(() => _quantity++);

  void _decrementQuantity() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  List<Dish> _getDishes() {
    List<Dish> bagDishes = [];
    for (int i = 0; i < _quantity; i++) {
      bagDishes.add(widget.dish);
    }

    return bagDishes;
  }

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: getAppBar(context: context, title: (widget.restaurantName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/dishes/default.png'),
              Text(
                widget.dish.name,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.highlightText,
                ),
              ),
              Text(
                "R\$${widget.dish.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                widget.dish.description,
                style: TextStyle(color: AppColors.textCards),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                    ),
                    onPressed: _decrementQuantity,
                    child: Icon(Icons.remove, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('$_quantity', style: TextStyle(fontSize: 16.0)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                    ),
                    onPressed: _incrementQuantity,

                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    bagProvider.addAllDishes(_getDishes());
                  },
                  child: Text("Adicionar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
