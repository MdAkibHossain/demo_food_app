enum Complexity {
  simple,
  challenging,
  hard,
}
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal(
      {
      // ignore: invalid_required_positional_param
      required this.id,
      required this.title,
      required this.categories,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});

  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
}
