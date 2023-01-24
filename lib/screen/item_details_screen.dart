import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_basic_project3/dummy_data.dart';

class ItemDetails extends StatelessWidget {
  static const routeName = "/ItemDetails";
  final toggleFavourite;
  final isFavourite;
  ItemDetails(this.toggleFavourite, this.isFavourite);
  Widget makeContainer(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)?.settings.arguments;
    final mealitem = DUMMY_MEALS.firstWhere((meal) => mealid == meal.id);
    return Scaffold(
      appBar: AppBar(title: Text(mealitem.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealitem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            makeContainer(context, 'Ingredients'),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Colors.amber,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(mealitem.ingredients[index])),
                    )),
                itemCount: mealitem.ingredients.length,
              ),
            ),
            makeContainer(context, 'Steps'),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${(index + 1)}'),
                          ),
                          title: Text(mealitem.steps[index]),
                        ),
                        Divider(),
                      ],
                    )),
                itemCount: mealitem.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(mealid),
      ),
    );
  }
}
