import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery.dart';

class GroceryLists extends StatelessWidget {
  final List<Grocery> groceries;

  const GroceryLists({super.key, required this.groceries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder:
          (ctx, index) => ListTile(
            title: Text(groceries[index].product),
            leading: Container(
              width: 24,
              height: 24,
              color: groceries[index].color,
            ),
            trailing: Text(groceries[index].quantity.toString()),
          ),
    );
  }
}
