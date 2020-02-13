import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFilters;


  FiltersScreen(this.currentFilters, this.saveFilter,);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegantarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegantarian' : _vegetarian
              };
              widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle('Gluten-free',
                    "Only include gluten-free meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle('Vegetarian',
                    "Only include vegetarian meals", _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTitle('Vegan',
                    "Only include vegan meals", _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                _buildSwitchListTitle('Lactose-free',
                    "Only include LactoseFree meals", _lactoseFree, (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
              ],
            ),


          )
        ],
      ),
    );
  }
}
