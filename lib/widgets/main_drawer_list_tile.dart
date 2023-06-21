import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onSelecetDrawerList});
  final IconData icon;
  final String title;
  final void Function() onSelecetDrawerList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      onTap: () {
        onSelecetDrawerList();
      },
    );
  }
}
