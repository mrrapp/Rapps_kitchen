import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  // require meal data
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
// making a getter
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap:() =>onSelectMeal(meal),
        child: Stack(children: [
          //meal image
          FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(
              meal.imageUrl,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 9,
                ),
                child: Column(children: [
                  // Title
                  Text(
                    meal.title,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Meta data
                      MealItemTrait(
                        icon: Icons.schedule,
                        label: '${meal.duration} mins',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      MealItemTrait(
                        icon: Icons.work,
                        label: complexityText,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      MealItemTrait(
                        icon: Icons.attach_money,
                        label: affordabilityText,
                      ),
                    ],
                  )
                ]),
              ))
        ]),
      ),
    );
  }
}