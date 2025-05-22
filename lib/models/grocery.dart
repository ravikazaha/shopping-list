import 'package:flutter/material.dart';

class Grocery {
  final int id;
  final String product;
  final int quantity;
  final Color color;

  Grocery(this.id, this.product, this.quantity, this.color);

  int get quantityValue {
    return quantity;
  }

  String get productName {
    return product;
  }
}