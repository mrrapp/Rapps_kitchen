import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // making logic for the body
  int _selectedPageIndex = 0;
// showing message on clicking favorite button on meals page
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to clear any snack maybe being displayed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  // function for adding or removing favorite meals
  final List<Meal> _favoriteMeals = [];
  void _updateFavoriteMeals(Meal meal) {
    // checking if meal is in favorite meal
    final mealExisting = _favoriteMeals.contains(meal);
    if (mealExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Favorite meal removed');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Favorite meal added');
      });
    }
  }

  void _selectPage(int index) {
    //you need to set state to update UI
    setState(() {
      _selectedPageIndex = index;
    });
  }

// function to set screen navigations for drawer options
  void _setScreen(String identifeir) async {
    Navigator.pop(context);
    if (identifeir == 'filter') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const Filterscreen(),
        ),
      );
      print(result);
    } else if (identifeir == 'settings') {}
  }

  @override
  Widget build(BuildContext context) {
    Widget actvePage = CategoriesScreen(
      onToggleFavorite: _updateFavoriteMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your Favorites';
      actvePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _updateFavoriteMeals,
      );
    }

    return Scaffold(
      drawer: MainDrawer(onSelectMenuOption: _setScreen),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(activePageTitle),
      ),
      body: actvePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
