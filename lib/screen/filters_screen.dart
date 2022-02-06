import '/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.filterData, required this.currentFilters})
      : super(key: key);
  static const routeName = '/filters';
  final Function filterData;
  final Map<String, bool?> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _glutenFree = false;
  bool? _vegan = false;
  bool? _vegetarian = false;
  bool? _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _vegan,
                'vegan': _vegetarian,
                'vegetarian': _lactoseFree,
              };

              widget.filterData(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree!,
                  title: const Text('Gluten-Free'),
                  subtitle: const Text('Only include gluten free meal'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _vegetarian!,
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include Vegetarian meal'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _vegan!,
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include Vegan meal'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  value: _lactoseFree!,
                  title: const Text('Lactose-Free'),
                  subtitle: const Text('Only include lactose free meal'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
