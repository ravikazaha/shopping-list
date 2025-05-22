import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_items.dart';
import 'package:shopping_list/widgets/grocery_lists.dart';
import 'package:shopping_list/widgets/new_item.dart';

final theme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 147, 229, 250),brightness: Brightness.dark, surface: const Color.fromARGB(255, 42, 51, 59)), scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60)
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {

  final List<GroceryItem> _groceryItems = groceryItems;

  _newItemHandler(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Grocery item added!")));
  }

  void _removeItemHandler(GroceryItem groceryItem) {
    _groceryItems.remove(groceryItem);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Grocery item deleted!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Groceries")),
      body: GroceryLists(groceries: _groceryItems, onRemoveItem: _removeItemHandler,),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _newItemHandler(context);
      }, child: Icon(Icons.add),),
    );
  }
}
