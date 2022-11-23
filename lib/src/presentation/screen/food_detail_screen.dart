import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';

import 'package:flutter_japanese_restaurant_app/src/presentation/widget/food_details_body.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/images_food_details_app_bar.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ImagesFoodDetailsAppBar(food: food),
          FoodDetalesBody(food: food),
        ],
      ),
    );
  }
}
