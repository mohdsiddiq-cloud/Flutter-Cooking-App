import 'dart:ui';

import 'package:flutter/material.dart';
import '../screen/catorgory_item_screen.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;
  CategoryItem(this.id, this.title, this.color);
  itemSelect(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/categoriesItem', arguments: {
      'id': id,
      'title': title,
      'color': color,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => itemSelect(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title
            // style: TextStyle(fontFamily: 'Raleway'),
            ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
