import 'package:flutter/material.dart';
import 'package:flutter_basic_project3/dummy_data.dart';
import 'package:flutter_basic_project3/model/meal.dart';
import 'package:flutter_basic_project3/widget/meal_item.dart';

class CategoriesItemScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoriesItemScreen(this.availableMeals);
  @override
  State<CategoriesItemScreen> createState() => _CategoriesItemScreenState();
}

class _CategoriesItemScreenState extends State<CategoriesItemScreen> {
  // final String categoryId;
  void _;
  late String categoryTitle;
  late List<Meal> displayMeals;
  bool _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArg =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      final categoryId = routeArg['id'];
      categoryTitle = routeArg['title'] as String;
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle.toString())),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
