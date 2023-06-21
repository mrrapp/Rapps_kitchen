import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/filter_switch_tile.dart';
import 'package:meals_app/widgets/main_drawer.dart';

// enum for working with will navogator pop
// to be used as keys for map
enum Filter {
  vegan,
  vegetarian,
  gluttenFree,
  lactoseFree,
}

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  var _gluttenFreeFilterSet = false;
  var _veganFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //code to show a drawer on filter screen
      // drawer: MainDrawer(onSelectMenuOption: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: ((context) => const TabsScreen()),
      //       ),
      //     );
      //   }
      // }),
      appBar: AppBar(
        title: const Text('My Filter'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegetarian: _vegetarianFilter,
          });
          return false;
        },
        child: Column(
          children: [
            // setting filter switches
            SwitchListTile(
              value: _gluttenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only contains Glutten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 110 / 5),
            ),
            FilterSwitchListTile(
              titleText: 'Vegan',
              subTitleText: 'Only contains vegan meals',
              onChanged: (isChecked) {
                setState(
                  () {
                    _veganFilter = isChecked;
                  },
                );
              },
              filterValue: _veganFilter,
            ),
            FilterSwitchListTile(
              titleText: 'Lactose Free',
              subTitleText: 'Only contains lactose free meals',
              onChanged: (checked) {
                setState(
                  () {
                    _lactoseFreeFilter = checked;
                  },
                );
              },
              filterValue: _lactoseFreeFilter,
            ),
            FilterSwitchListTile(
              titleText: 'Vegetarian',
              subTitleText: 'Only contains vegatarian meals',
              onChanged: (isChecked) {
                setState(
                  () {
                    _vegetarianFilter = isChecked;
                  },
                );
              },
              filterValue: _vegetarianFilter,
            ),
          ],
        ),
      ),
    );
  }
}
