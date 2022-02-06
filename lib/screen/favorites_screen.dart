import '/models/meal.dart';
import '/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.favoriteMeal);

  final List<Meal> favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You Have no Favorite Yet. Start add someting!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            imageUrl: favoriteMeal[index].imageUrl,
            affordability: favoriteMeal[index].affordability,
            id: favoriteMeal[index].id,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
