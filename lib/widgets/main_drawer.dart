import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectMenuOption});
  final void Function(String identifier) onSelectMenuOption;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: [
                // iocn
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Rapp\'s Kitchen',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          DrawerTile(
              icon: Icons.restaurant,
              title: 'Meals',
              onSelecetDrawerList: () {
                onSelectMenuOption('meals');
              }),
          DrawerTile(
              icon: Icons.filter_alt,
              title: 'Filter',
              onSelecetDrawerList: () {
                onSelectMenuOption('filter');
              }),
          DrawerTile(
              icon: Icons.settings,
              title: 'Settings',
              onSelecetDrawerList: () {
                onSelectMenuOption('settings');
              }),
          //  DrawerTile(icon: Icons.payment, title: 'Payment',onSelecetDrawerList: (){}),
          //  DrawerTile(icon: Icons.logout, title: 'Log out',onSelecetDrawerList: (){}),
        ],
      ),
    );
  }
}
