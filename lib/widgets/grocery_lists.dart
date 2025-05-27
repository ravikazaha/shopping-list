import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_items.dart';

class GroceryLists extends StatelessWidget {
  final List<GroceryItem> groceries;
  final bool isLoading;
  final void Function(GroceryItem goceryItem) onRemoveItem;

  const GroceryLists({super.key, required this.groceries, required this.onRemoveItem, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(),);
    }

    if (groceries.isEmpty) {
      return Center(child: Text("No Grocery Items founds"),);
    }

    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            background: Container(color: Colors.red,),
            onDismissed: (direction) {
            onRemoveItem(groceries[index]);
          }, key: ValueKey(groceries[index].id), child: ListTile(
            title: Text(groceries[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceries[index].category.color,
            ),
            trailing: Text(groceries[index].quantity.toString()),
          ),)
    );
  }
}
