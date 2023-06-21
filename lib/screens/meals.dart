import 'package:flutter/material.dart';

import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite
  });
// screen needs to accept meals and title from category
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  // function for selecting meals
  void _mealSelected(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailScreen(meal: meal,onToggleFavorite: onToggleFavorite, ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Oh ooo ... Nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try Selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) => _mealSelected(context, meal),
        ),
      );
    }

//     Widget content = ListView.builder(
//       itemCount: meals.length,
//       itemBuilder: (context, index) => MealItem(
//         meal: meals[index],
//         onSelectMeal: (meal) => _mealSelected(context, meal),
//       ),
//     );

// ////condition to check if no meal is selected
//     if (meals.isEmpty) {
//       content = Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Oh ooo ... Nothing here',
//               style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Try Selecting a different category',
//               style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//           ],
//         ),
//       );
//     }
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
