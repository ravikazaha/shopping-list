import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_lists.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/widgets/new_item.dart';

final theme = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 147, 229, 250),brightness: Brightness.dark, surface: const Color.fromARGB(255, 42, 51, 59)), scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60)
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Grocery> groceries;

  MyApp({super.key})
    : groceries = [
        Grocery(1,"Milk", 1, Colors.blue),
        Grocery(2,"Bananas", 5, Colors.green),
        Grocery(3,"Beef Steak", 1, Colors.orange),
      ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: theme,
      home: MyHomePage(groceries: groceries),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Grocery> groceries;

  const MyHomePage({required this.groceries, super.key});

  _newItemHandler(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Groceries")),
      body: GroceryLists(groceries: groceries,),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _newItemHandler(context);
      }, child: Icon(Icons.add),),
    );
  }
}
