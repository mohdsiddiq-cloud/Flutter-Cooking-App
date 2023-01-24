import 'package:flutter/material.dart';
import 'package:flutter_basic_project3/model/meal.dart';
import 'package:flutter_basic_project3/screen/categories_screen.dart';
import 'package:flutter_basic_project3/screen/favourites_screen.dart';
import 'package:flutter_basic_project3/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _pageIndex = 0;
  @override
  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favourite'
      }
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_pageIndex]['title'] as String)),
      drawer: MainDrawer(),
      body: _pages[_pageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _pageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'favourite',
            ),
          ]),
    );
  }
}
