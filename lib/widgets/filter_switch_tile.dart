import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatefulWidget {
  const FilterSwitchListTile({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.onChanged,
    required this.filterValue
  });
  final String subTitleText;
  final String titleText;
  final bool filterValue;

  final void Function(bool isChecked) onChanged;
  @override
  State<FilterSwitchListTile> createState() => _FilterSwitchListTileState();
}

class _FilterSwitchListTileState extends State<FilterSwitchListTile> {
  // var _gluttenFreeSet = false;
  // var _lactoseFree = false;
  // var _vegan = false;
  //var filterValue = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.filterValue,
      onChanged:widget.onChanged,
      //  (isChecked) {
      //   widget.onChanged;
      // },
      title: Text(
        widget.titleText,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        widget.subTitleText,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 110 / 5),
    );
  }
}
