import 'package:flutter/material.dart';

class Cart {
  List<Map<String, String>> items = [];

  void addItem(Map<String, String> item) {
    items.add(item);
  }

  List<Map<String, String>> getItems() {
    return items;
  }
}
